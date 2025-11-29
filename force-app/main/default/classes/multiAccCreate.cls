/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-24-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class multiAccCreate {

    public static string getToken() {
Http http =new Http();
HttpRequest req=new HttpRequest();
req.setMethod('POST');
req.setEndPoint('https://test.salesforce.com/services/oauth2/token');
req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
String clientId = '3MVG9HoFrxrSzmIz2L4Ao6wdyurkk11RNBYgs7uleiiaBejI0Vne.jbPUkJu3Uds6Fkuv7fk2wWcIutUOBaXN';
        String clientSecret = '6B0F4BEA48F21C20AE6DC1C9A60D49DC0E70B4571DDE8CF16A472143B8C8F9A1';
        String username = 'gaurav.jagtap@orange.com.devgj';
        String password = 'Welcome@123456$t2NWTQEBBJqyGvUNsmtdT04J';

         String body = 'grant_type=password'
                    + '&client_id=' + EncodingUtil.urlEncode(clientId, 'UTF-8')
                    + '&client_secret=' + EncodingUtil.urlEncode(clientSecret, 'UTF-8')
                    + '&username=' + EncodingUtil.urlEncode(username, 'UTF-8')
                    + '&password=' + EncodingUtil.urlEncode(password, 'UTF-8');
req.setBody(body);

HttpResponse resp=http.send(req);
        SYSTEM.DEBUG(resp.getBody());
if(resp.getStatusCode()==200){
    map<string,Object> resultMap=(map<string,Object>) JSON.deserializeUntyped(resp.getBody());
    return (string) resultMap.get('access_token');
}
else{
    return null;
}
    }
public static void createAcc(list<Account> acclist){
string token=getToken();
    SYSTEM.DEBUG(token);
    Http http=new Http();
    HttpRequest req=new HttpRequest();
    req.setMethod('POST');
    req.setEndPoint('https://samba--devgj.sandbox.my.salesforce.com/services/apexrest/createbulkAccount');
    req.setHeader('Authorization', 'Bearer ' + token);
    req.setHeader('Content-Type', 'application/json');

  

string body=JSON.serialize(acclist);
    SYSTEM.DEBUG(body);
req.setBody(body);

HttpResponse resp=http.send(req);
    system.debug(resp.getStatusCode());
system.debug(resp.getBody());
}















}