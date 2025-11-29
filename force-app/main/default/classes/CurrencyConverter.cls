public class CurrencyConverter {

    @future(callout=true)
    public static void convertAndUpdateUSDAmount(Set<Id> oppIds) {
        List<Opportunity> oppsToUpdate = [SELECT Id, Amount FROM Opportunity WHERE Id IN :oppIds];
        List<Opportunity> updates = new List<Opportunity>();

        for (Opportunity opp : oppsToUpdate) {
            try {
                Decimal amountInINR = opp.Amount;
                String endpoint = 'https://api.frankfurter.app/latest?amount=' + amountInINR + '&from=INR&to=USD';

                Http http = new Http();
                HttpRequest request = new HttpRequest();
                request.setEndpoint(endpoint);
                request.setMethod('GET');

                HttpResponse response = http.send(request);
                if (response.getStatusCode() == 200) {
                    Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
system.debug(resultMap.values() );
 system.debug(resultMap.keySet() );                   
                    if (resultMap.containsKey('rates')) {
                        Map<String, Object> ratesMap = (Map<String, Object>) resultMap.get('rates');
                        if (ratesMap.containsKey('USD')) {
                            Decimal usdAmount = (Decimal)(ratesMap.get('USD'));
                            opp.dollerAmount__c = usdAmount;
                            updates.add(opp);
                        }
                    }
                }
            } catch (Exception e) {
                System.debug('>>> Error converting currency: ' + e.getMessage());
            }
        }

        if (!updates.isEmpty()) {
            update updates;
        }
    }
}