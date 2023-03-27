public with sharing class WerherController2 {
    public WerherController2(){}
    
    @AuraEnabled(cacheable = true)
    public static weather__c getWetherForComponent(Id userId){
        List<weather__c> contactsSityes = [SELECT Id, Temprat__c, temperature_in_F__c, gust_mph__c, city__c, Contact__c FROM weather__c WHERE Contact__c=:userId LIMIT 1];
		return contactsSityes[0];
    }
}