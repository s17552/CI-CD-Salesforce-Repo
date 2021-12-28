/**
 * Created by ychuiev001 on 18.06.2019.
 */

@IsTest
private class AnimalLocatorTest {

    @IsTest
    public static void testPositive (){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        Test.startTest();

        System.assertEquals(
            'chicken',
            AnimalLocator.getAnimalNameById(1)
        );
        Test.stopTest();
    }

    /*@IsTest
    public static void testNegative (){
        AnimalLocatorMock mock = new AnimalLocatorMock();
        Test.setMock(HttpCalloutMock.class, mock);
        System.assertEquals(
            '',
            AnimalLocator.getAnimalNameById(1)
        );
    }*/

}