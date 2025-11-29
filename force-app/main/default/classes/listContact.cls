/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-03-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class listContact {
    @AuraEnabled(cacheable=true)
    public static list<contact> contactList() {
return [select Id,FirstName,LastName,Email from Contact ORDER BY CreatedDate DESC LIMIT 10];
    }

@AuraEnabled
public static void dltContact(Id contactId){

    contact con=[select Id from contact where Id=:contactId];
    delete con;

}

@AuraEnabled
public static void dltbulk(list<Id> conIds){
list<contact> conlist=[select Id,FirstName,LastName,Email from contact where Id IN : conIds ];
delete conlist;
}


}