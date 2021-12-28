/**
 * Created by ychuiev001 on 19.06.2019.
 */
@IsTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke (Object stub,
        Object request, Map<String, Object> response,
        String endpoint, String soapAction,
        String requestName, String responseNS,
        String responseName, String responseTyp
    ) {
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        response_x.return_x = new List<String>{
            'Hamburg Wadden Sea National Park',
            'Hainich National Park',
            'Bavarian Forest National Park'
        };
        response.put('response_x', response_x);
    }
}