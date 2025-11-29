trigger Account_trigger on Account (before insert,after update,after insert,before update) {
    set<Id> accset=new set<Id>();
    for(Account accobj:trigger.new){
        accset.add(accobj.Id);
        if(trigger.isinsert && trigger.isbefore && string.isNotBlank(accobj.BillingStreet)){
            accobj.ShippingStreet=accobj.BillingStreet;
        }
        if(trigger.isinsert && trigger.isbefore && string.isNotBlank(accobj.BillingCity)){
            accobj.ShippingCity=accobj.BillingCity;
        }
        if(trigger.isinsert && trigger.isbefore &&string.isNotBlank(accobj.BillingCountry)){
            accobj.ShippingCountry=accobj.BillingCountry;
        }
       
    
    list<Opportunity> oppolist=new list<Opportunity>();
        for (Opportunity oppo:[select Id,Name,StageName,CreatedDate,AccountId,Amount from Opportunity where AccountId IN:accset]){
            oppolist.add(oppo);
        }
        Double totalamount=0;
        Datetime day30=system.now()-30;
         if(trigger.isupdate && trigger.isafter){
        for(Opportunity opponew: oppolist){
            if(opponew.CreatedDate>day30 && opponew.StageName !='Closed Won'){
                opponew.StageName='Closed Lost';
            }
        }
        }
        if(trigger.isupdate && trigger.isbefore){
            for(Opportunity oppo:oppolist){
                totalamount +=oppo.Amount;
                totalamount++;
            }
            accobj.site=string.valueOf(totalamount);
        }
        if(!oppolist.isEmpty())
        database.update(oppolist);
    }  
}