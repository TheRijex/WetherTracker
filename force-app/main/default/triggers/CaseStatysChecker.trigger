trigger CaseStatysChecker on Case (before insert) {
	Map <String, Integer> weightOfStatus = new Map <String, Integer>();
    
    weightOfStatus.put('received', 1);
    weightOfStatus.put('assigned', 2);
    weightOfStatus.put('in progress', 3);
    weightOfStatus.put('canceled', 4);
    
    List<Case> priviosCasesStatus = [SELECT Id, Status FROM Case WHERE Id IN : Trigger.new];
}