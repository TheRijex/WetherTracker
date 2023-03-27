global class BatchCalloutContactCity  implements Database.Batchable<sObject>, Database.AllowsCallouts {
	Map<Id, Contact> idContactMapBatch = new Map<Id, Contact>();//rename
    
    global BatchCalloutContactCity (Map<Id, Contact> idContactMap) {
        this.idContactMapBatch = idContactMap;
    }
    public Database.QueryLocator start (Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, MailingCity FROM Contact WHERE Id IN:idContactMapBatch.keySet()]);
    }    
    
    public void execute(Database.BatchableContext bc, List<Contact> conList) {
        for(Contact con : conList) {
            Map<String, Object> wetherPrepairedFields   = new Map<String, Object>(WeatherPredictor.getWeatherInfo(con.MailingCity));
            WeatherPredictor.preparingAndInsertingData(wetherPrepairedFields, con.MailingCity, con.Id);
        }
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug('Batch Done');
    }

}