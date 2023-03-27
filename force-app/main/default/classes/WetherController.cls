public with sharing class WetherController {
    public WetherController() {
        Map<String, Object> wetherPrepairedFields   = new Map<String, Object>(WeatherPredictor.getWeatherInfo('Minsk'));
		    WeatherPredictor.preparingAndInsertingData(wetherPrepairedFields, 'Minsk');
    }
}