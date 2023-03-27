public class WeatherPredictor {
	
    public static Map<String, Object> getWeatherInfo(String city) {
        
		sObject    		    apiObj 				  = APIcred__mdt.getAll().values()[0];
        String		        apiKey 				  =(String)apiObj.get('ApiKey__c');
        String		        urlPath 			  =(String)apiObj.get('APIUrlAdress__c');
        String		  	    urlPostfix 			  =(String)apiObj.get('Url_PostFix__c');
       
        Map<String, Object> deserializeData 	  = new Map<String, Object>();
 		List<Decimal>       wetherPrepairedFields = new List<Decimal>();
        Http   		  	    http   		   		  = new Http();
        HttpRequest   	    weatherRequest 		  = new HttpRequest();
        
        weatherRequest.setEndpoint(urlPath + apiKey + city + urlPostfix);
        weatherRequest.setMethod('GET'); 
        HttpResponse apiResponseAboutWeather = http.send(weatherRequest);
        apiResponseAboutWeather.getStatusCode();
        
        if(apiResponseAboutWeather.getStatusCode() == 200) {
            Map<String, Object> result  = (Map<String, Object>) JSON.deserializeUntyped(apiResponseAboutWeather.getBody());
            deserializeData    			= (Map<String, Object>) result.get('current');
				system.debug(deserializeData);
            return deserializeData;
        }
        return deserializeData;
    }
    
    public static weather__c preparingAndInsertingData(Map<String, Object> deserializeData, String City) {
        if(deserializeData.size() > 0) {
              weather__c prepairWetherObject = new weather__c (
                Temprat__c = (Decimal) deserializeData.get('feelslike_c'),
                temperature_in_F__c = (Decimal) deserializeData.get('feelslike_f'),
                gust_mph__c = (Decimal) deserializeData.get('gust_mph'),
                city__c = City
            );
           
            try {
                if (Schema.sObjectType.weather__c.isCreateable()) {
					insert prepairWetherObject;
                    return prepairWetherObject;
                     
                }     
            }
            catch(DmlException e) {
                System.debug('Message: ' + e.getMessage());
            }  
        }
        return null;
    }
    public static void preparingAndInsertingData(Map<String, Object> deserializeData, String City, String contactId) {
        if(deserializeData.size() > 0) {
              weather__c prepairWetherObject = new weather__c (
                Temprat__c = (Decimal) deserializeData.get('feelslike_c'),
                temperature_in_F__c = (Decimal) deserializeData.get('feelslike_f'),
                gust_mph__c = (Decimal) deserializeData.get('gust_mph'),
                city__c = City,
                Contact__c = String.isBlank(contactId)? null : contactId
            );
           
            try {
                if (Schema.sObjectType.weather__c.isCreateable()) {
					insert prepairWetherObject;
                }     
            }
            catch(DmlException e) {
                System.debug('Message: ' + e.getMessage());
            }  
        }  
    }
    
}