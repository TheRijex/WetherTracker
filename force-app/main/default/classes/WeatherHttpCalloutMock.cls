@isTest
global class WeatherHttpCalloutMock implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req) {
        System.assertEquals('http://api.weatherapi.com/v1/current.json?key=f3d0930af8df4639ab0112915230203&q=Minsk&aqi=no', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"location":{"name":"Minsk","region":"Minsk","country":"Belarus","lat":53.9,"lon":27.57,"tz_id":"Europe/Minsk","localtime_epoch":1678363335,"localtime":"2023-03-09 15:02"},"current":{"last_updated_epoch":1678363200,"last_updated":"2023-03-09 15:00","temp_c":0.0,"temp_f":32.0,"is_day":1,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png","code":1000},"wind_mph":6.9,"wind_kph":11.2,"wind_degree":300,"wind_dir":"WNW","pressure_mb":997.0,"pressure_in":29.44,"precip_mm":0.0,"precip_in":0.0,"humidity":40,"cloud":0,"feelslike_c":-3.1,"feelslike_f":26.3,"vis_km":10.0,"vis_miles":6.0,"uv":1.0,"gust_mph":7.2,"gust_kph":11.5}}');
        res.setStatusCode(200);
        return res;
        
    }
}