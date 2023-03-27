global class scheduledrecordOfWetherForMinsk implements Schedulable {
    global void execute (SchedulableContext SC) {
        FMinskWetherInserter.addMinskWetherReport();
    }
}