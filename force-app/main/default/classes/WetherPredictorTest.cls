@isTest
private class WetherPredictorTest {

    @isTest static void testMethod1() {
        List <Decimal> testTemperature = new List<Decimal>();
        testTemperature.add(12.40);
        testTemperature.add(27.70);
        testTemperature.add(19.40);
        String cityName = 'Minsk';
        Test.startTest();
        WeatherPredictor.preparingAndInsertingData(testTemperature, cityName);
        Test.stopTest();
    }
     @isTest static void testMethod2() {
        List <Decimal> testTemperature = new List<Decimal>();
        testTemperature.add(12.40);
        testTemperature.add(27.70);
        testTemperature.add(19.40);
        String cityName = '';
        Test.startTest();
        WeatherPredictor.preparingAndInsertingData(testTemperature, cityName);
        Test.stopTest();
    }
}