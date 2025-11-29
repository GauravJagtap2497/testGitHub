trigger oppoAmountTrigger on Opportunity (after insert) {
     Set<Id> oppIds = new Set<Id>();
    for (Opportunity opp : Trigger.new) {
        if (opp.Amount != null) {
            oppIds.add(opp.Id);
        }
    }

    if (!oppIds.isEmpty()) {
        CurrencyConverter.convertAndUpdateUSDAmount(oppIds);
    }
}