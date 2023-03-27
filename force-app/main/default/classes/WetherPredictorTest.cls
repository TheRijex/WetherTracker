@isTest
global class WetherPredictorTest {

    @isTest static void testMethod1() {
        Map<String, Object> testTemperature = new Map<String, Object>();
        testTemperature.put('feelslike_c', 12.40);
        testTemperature.put('feelslike_f', 27.70);
        testTemperature.put('gust_mph', 19.40);
        testTemperature.put('condition', '{code=1000,icon=//cdn.weatherapi.com/weather/64x64/day/113.png, text=Sunny}');
        String cityName = 'Minsk';
        Test.startTest();
        WeatherPredictor.preparingAndInsertingData(testTemperature, cityName);
        Test.stopTest();
    }
    
        @isTest static void testMethod3() {
        Map<String, Object> testTemperature = new Map<String, Object>();
        testTemperature.put('feelslike_c', 12.40);
        testTemperature.put('feelslike_f', 27.70);
        testTemperature.put('gust_mph', 19.40);
        testTemperature.put('condition', '{code=1000,icon=//cdn.weatherapi.com/weather/64x64/day/113.png, text=Sunny}');
        Contact con = new Contact(LastName = 'Test', MailingCity = 'Minsk');
        insert con;
        String cityName = 'Minsk';
        Test.startTest();
        WeatherPredictor.preparingAndInsertingData(testTemperature, cityName, con.Id);
        Test.stopTest();
    }
	
    @isTest static void testMethod2() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new WeatherHttpCalloutMock());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
       Map<String, Object> res = WeatherPredictor.getWeatherInfo('Minsk');

    }

}