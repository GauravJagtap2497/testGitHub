/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-29-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SearchAccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAcc(String searchacc){
   searchacc='%'+searchacc+'%';
   List<Account> acc=[SELECT Id, Name, Phone, Website, Industry, Owner.Name, Active__c FROM Account WHERE Name LIKE :searchacc];
   return acc;
    }
    
}