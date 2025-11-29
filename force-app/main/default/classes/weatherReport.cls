/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-15-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class weatherReport {
    public class WeatherResponse {
       @AuraEnabled public string Description;
       @AuraEnabled public Decimal Temprature;
       @AuraEnabled public Decimal Humidity;

     public WeatherResponse(string Des,Decimal temp,Decimal Hum){
   this.Description=Des;
   this.Temprature=temp;
   this.Humidity=Hum;

     }
        
    }
    @AuraEnabled
    public static WeatherResponse weatherReportOne(string cityName) {
string apiKey='a419e5619af3ddcad33e59751c1d5520';
    Http http=new Http();
    HttpRequest request=new HttpRequest();
    string endpoint='https://api.openweathermap.org/data/2.5/weather?q='+EncodingUtil.urlEncode(cityName, 'UTF-8')+'&appid='+apiKey+ '&units=metric';
    request.setEndPoint(endpoint);
    request.setMethod('GET');

    HttpResponse response=http.send(request);
    if(response.getStatusCode()==200){
       map<string,Object> resultMap=(map<string,Object>) JSON.deserializeUntyped(response.getBody());

       map<string,Object> mainMap=(map<string,Object>) resultMap.get('main');
       Decimal tempr=(Decimal) mainMap.get('temp');
       Decimal Humid=(Decimal) mainMap.get('humidity');

       list<Object> weatherlist=(list<Object>) resultMap.get('weather');
       map<string,Object> weatherDesc=(map<string,Object>) weatherlist[0];
       string desr=(string) weatherDesc.get('description');


       WeatherResponse wr=new WeatherResponse(desr,tempr,Humid);
       return wr;
    }
    else{
        return null;
    }

}


}