public with sharing class WerherController2 {
    public WerherController2(){}
    
    @AuraEnabled(cacheable = true)
    public static List<weather__c> getWetherForComponent(String userId){
        return [SELECT Id, Temprat__c, temperature_in_F__c, gust_mph__c, city__c, Contact__c FROM weather__c WHERE Contact__c=:userId LIMIT 1];
		
    }
}