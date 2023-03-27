trigger CaseStatysChecker on Case (before update) {
    if(Trigger.isBefore) {
        if(Trigger.isUpdate) {
            CaseStatysChecker.checkStatys(Trigger.OldMap, Trigger.NewMap);
        }
    }
}