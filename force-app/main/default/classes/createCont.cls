/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-25-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class createCont {
    @AuraEnabled
    public static void contactCreate (string firstName,string lastName){
        try {
            contact con=new contact();
            con.firstName=firstName;
            con.lastName=lastName;
            insert con;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

@AuraEnabled(cacheable=true)
public static Contact letestCont(){
list<Contact> conlist= [select Id,firstName,lastName,Email,CreatedDate from Contact ORDER BY CreatedDate DESC limit 1];
If(!conlist.isEmpty()){
    return conlist[0];
}else{
    return null;
}

}
    @AuraEnabled
     public static void deleteContact(string contactId){
delete[select Id,Name from Contact where Id =: contactId];
 }
}