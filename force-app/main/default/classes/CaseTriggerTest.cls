@isTest
private class CaseTriggerTest {

    static testmethod void TestCaseInsert() {
        Case case1 = new Case (
        	Status= 'canceled',
            Origin = 'Phone',
            rolldown__c = false
        );
        insert case1;
        
        case1.Status= 'assigned';
        System.assertEquals(false, case1.rolldown__c);
        Test.startTest();
			update case1;
        Test.stopTest();
        System.assertEquals(true, [SELECT rolldown__c FROM Case WHERE Id =: case1.Id LIMIT 1].rolldown__c);
    }
}