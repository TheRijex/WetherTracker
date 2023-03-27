public with sharing class WetherController {

    public static weather__c getWetherForComponent(Id userId){
        List<Contact> contactsSityes = [SELECT Id, MailingCity FROM Contact WHERE Id=:userId LIMIT 1];
        String sity = contactsSityes[0].MailingCity;
        Map<String, Object> wetherPrepairedFields   = new Map<String, Object>(WeatherPredictor.getWeatherInfo(sity));
		return WeatherPredictor.preparingAndInsertingData(wetherPrepairedFields, sity);
    }
}