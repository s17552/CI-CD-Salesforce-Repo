/**
 * Created by ychuiev001 on 18.06.2019.
 */

public with sharing class AnimalLocator {
/*    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>)
                JSON.deserializeUntyped(response.getBody());

            results = (Map<String, Object>)JSON.deserializeUntyped(
                JSON.serialize(results.get('animal'))
            );
            return String.valueOf(results.get('name'));
        }
        return '';
    }*/
    public static String getAnimalNameById (Integer ID) {

        String animal = ' ';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String s = String.valueOf(ID);
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + ID);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Map<String, Object> animals = new Map<String, Object>();
        Map<String, Object> results = (Map<String, Object>)
            JSON.deserializeUntyped(response.getBody());

        results = (Map<String, Object>) JSON.deserializeUntyped(
            JSON.serialize(results.get('animal'))
        );
        return String.valueOf(results.get('name'));


    }

}