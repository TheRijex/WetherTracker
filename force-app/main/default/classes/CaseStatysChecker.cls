public with sharing class CaseStatysChecker {
    public static void checkStatys (Map<Id, Case> oldCases, Map<Id, Case> newCases) {
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Case.Status.getDescribe();
        List<Schema.PicklistEntry> plCaseValue = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : plCaseValue){
            pickListValuesList.add(pickListVal.getLabel());
        }     
        
        for (Case caseTriggered : newCases.values()) {
            String oldStatus = oldCases.get(caseTriggered.Id).Status;
            String newStatus = caseTriggered.Status;
            if(oldStatus != newStatus && pickListValuesList.indexOf(newStatus) < pickListValuesList.indexOf(oldStatus)) {
                if(Schema.sObjectType.Case.fields.rolldown__c.isUpdateable()) {
                    caseTriggered.rolldown__c = true;  
                }
                
            }
        }
    }
}