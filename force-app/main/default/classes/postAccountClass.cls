/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-18-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class postAccountClass {

    public static string getToken() {
Http http=new Http();
HttpRequest request=new HttpRequest();
request.setEndPoint('https://test.salesforce.com/services/oauth2/token');
request.setMethod('POST');

string key='3MVG9HoFrxrSzmIz2L4Ao6wdyurkk11RNBYgs7uleiiaBejI0Vne.jbPUkJu3Uds6Fkuv7fk2wWcIutUOBaXN';
string secret='6B0F4BEA48F21C20AE6DC1C9A60D49DC0E70B4571DDE8CF16A472143B8C8F9A1';
string username='gaurav.jagtap@orange.com.devgj';
string pass='Welcome@123456$t2NWTQEBBJqyGvUNsmtdT04J';

string Body = 'grant_type=password'
+ '&client_id=' + EncodingUtil.urlEncode(key, 'UTF-8')
+ '&client_secret=' + EncodingUtil.urlEncode(secret, 'UTF-8')
+ '&username=' + EncodingUtil.urlEncode(username, 'UTF-8')
+ '&password=' + EncodingUtil.urlEncode(pass, 'UTF-8');
request.setBody(Body);
request.setHeader('Content-Type', 'application/x-www-form-urlencoded');

HttpResponse response= http.send(request);
if(response.getStatusCode()==200){
    map<string,Object> resultmap=(map<string,Object>) JSON.deserializeUntyped(response.getBody());
return (string) resultmap.get('access_token');
}
else{
    return null;
}
    }
@AuraEnabled

public static void postAccount(String accName, String accPhone){
string accessToken=getToken();
Http http=new Http();
HttpRequest request=new HttpRequest();
request.setMethod('POST');
string endpoint='https://samba--devgj.sandbox.my.salesforce.com/services/data/v60.0/sobjects/Account/';
request.setEndPoint(endpoint);

map<string,Object> accmap=new map<string,Object>();
accmap.put('Name',accname);
accmap.put('Phone',accPhone);
 

String serializedResult = JSON.serialize(accmap);
request.setBody(serializedResult);
request.setHeader('Authorization', 'Bearer ' + accessToken);
request.setHeader('Content-Type', 'application/json');


HttpResponse response=http.send(request);
if(response.getStatusCode()==201){
system.debug('Account created successsfully'+response.getBody());
}else {
    system.debug('Account creation failed'+response.getBody());

}












}












}