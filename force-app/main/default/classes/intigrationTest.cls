/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-11-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class intigrationTest {
    @AuraEnabled(cacheable=false)
    public static List<AccountWrapper> fetchAccount(String searchKey) {
        String tokenString = getAccessToken();
        if (tokenString == null) {
            throw new AuraHandledException('Failed to retrieve access token.');
        }

        // Proper SOQL and query construction
        String soql = 'SELECT Id, Name FROM Account WHERE Name LIKE \'%' + searchKey + '%\' LIMIT 10';
        String query = EncodingUtil.urlEncode(soql, 'UTF-8');
        String endpoint = 'https://samba--devgj.sandbox.my.salesforce.com/services/data/v60.0/query?q=' + query;

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer ' + tokenString);

        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> recordObj = (List<Object>) resultMap.get('records');
            List<AccountWrapper> accList = new List<AccountWrapper>();

            for (Object obj : recordObj) {
                Map<String, Object> recordMap = (Map<String, Object>) obj;
                accList.add(new AccountWrapper((String) recordMap.get('Id'), (String) recordMap.get('Name')));
            }

            return accList;
        } else {
            throw new AuraHandledException('Account fetch failed: ' + response.getStatusCode() + ' - ' + response.getBody());
        }
    }

    private static String getAccessToken() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://test.salesforce.com/services/oauth2/token');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Replace with your real credentials
        String clientId = '3MVG9HoFrxrSzmIz2L4Ao6wdyurkk11RNBYgs7uleiiaBejI0Vne.jbPUkJu3Uds6Fkuv7fk2wWcIutUOBaXN';
        String clientSecret = '6B0F4BEA48F21C20AE6DC1C9A60D49DC0E70B4571DDE8CF16A472143B8C8F9A1';
        String username = 'gaurav.jagtap@orange.com.devgj';
        String password = 'Welcome@123456$t2NWTQEBBJqyGvUNsmtdT04J';

        String body = 'grant_type=password'
                    + '&client_id=' + EncodingUtil.urlEncode(clientId, 'UTF-8')
                    + '&client_secret=' + EncodingUtil.urlEncode(clientSecret, 'UTF-8')
                    + '&username=' + EncodingUtil.urlEncode(username, 'UTF-8')
                    + '&password=' + EncodingUtil.urlEncode(password, 'UTF-8');

        request.setBody(body);

        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            return (String) resultMap.get('access_token');
        } else {
            System.debug('Failed to get token: ' + response.getBody());
            return null;
        }
    }

   
    public class AccountWrapper {
        @AuraEnabled public String Id;
        @AuraEnabled public String Name;
    
        public AccountWrapper(String Id, String Name) {
            this.Id = Id;
            this.Name = Name;
        }
    }
}