/**
 * Created by ychuiev001 on 18.06.2019.
 */
@IsTest
global class AnimalLocatorMock implements HttpCalloutMock {

    global HttpResponse respond(HttpRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        response.setStatusCode(200);
        return response;
    }
}