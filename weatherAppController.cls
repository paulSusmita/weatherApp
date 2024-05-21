public with sharing class weatherAppController {
    @AuraEnabled
    public static String getWeatherDetails(String input){
        String url='https://api.openweathermap.org/data/2.5/weather?q='+input+'&units=metric'+getKey();
        String response=getResponse(url);
        return response;
    }
    public static String getResponse(String url){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res= new HttpResponse();       
        req.setMethod('GET');        
        req.setEndpoint(url);
        req.setTimeout(120000);
        res=h.send(req);
        String responseBody = res.getBody();
        System.debug(responseBody);
        return responseBody;        
    }
    public static String getKey(){
        String key='5bb3da9a4678df487a208dd1ab1d65fe';
        String output = '&appid='+key;
        return output;
    }
}