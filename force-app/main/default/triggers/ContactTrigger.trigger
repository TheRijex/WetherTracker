trigger ContactTrigger on Contact (after insert, after update) {
    if(Trigger.isAfter) {
        if(Trigger.isUpdate) {
        	ContactTriggerHendler.callBatchToGetWether(Trigger.newMap);
        }
        if(Trigger.isInsert) {
            ContactTriggerHendler.callBatchToGetWether(Trigger.newMap);
        }
    }
}