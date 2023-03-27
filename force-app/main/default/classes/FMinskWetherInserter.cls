public class FMinskWetherInserter {
    public static void addMinskWetherReport () {
      	Map<String, Object> wetherPrepairedFields   = new Map<String, Object>(WeatherPredictor.getWeatherInfo('Minsk'));
		WeatherPredictor.preparingAndInsertingData(wetherPrepairedFields, 'Minsk');  
    }
}