/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/


public with sharing class SpotifyClass {
    @AuraEnabled
    public static string spotifysearch( string trackName){
        
            Http httpObject = new Http();
            HttpRequest request = new HttpRequest();
            request.setMethod('GET');
            string encoding=EncodingUtil.urlEncode(trackName,'UTF-8');
            request.setEndpoint('callout:spotify/v1/search?'+encoding+'&offset=1&limit=10&type=track');
           try {
            HttpResponse response = httpObject.send(request);
            String responseBody = response.getBody();
            if (response.getStatusCode() == 200) {
                return response.getBody();
} else {
    throw new AuraHandledException(response.getBody());
}
}catch  (Exception ex) {
    throw new AuraHandledException(ex.getMessage());
} 
   
         }
    
}