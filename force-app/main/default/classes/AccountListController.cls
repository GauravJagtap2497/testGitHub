public class AccountListController {
    
    @AuraEnabled
    public static List < Account > fetchAccts() {
        
        return [ SELECT Id, Name FROM Account ];
        
    }
    @AuraEnabled
    public static List < Contact > fetchCons(id Accid) {
        
        return [ SELECT Id,Name,AccountId FROM Contact Where AccountId = :Accid];
        
    }
    
}