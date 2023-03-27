public with sharing class ContactTriggerHendler{
    
    public static void callBatchToGetWether(Map<Id, Contact> contFromTrigger) {
        if(contFromTrigger.size() > 0) {
            Database.executeBatch(new BatchCalloutContactCity(contFromTrigger), 50);
        }
    }
}