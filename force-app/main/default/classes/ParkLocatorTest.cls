/**
 * Created by ychuiev001 on 19.06.2019.
 */
@IsTest
private class ParkLocatorTest {

    @IsTest
    static void test () {
       Test.setMock(WebServiceMock.class, new ParkServiceMock());

        Test.startTest();
        List<String> actual = ParkLocator.country('Germany');
        Test.stopTest();

        System.assertEquals(new List<String> {
            'Hamburg Wadden Sea National Park',
            'Hainich National Park',
            'Bavarian Forest National Park'
        }, actual);
}
}