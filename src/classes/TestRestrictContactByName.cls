/**
 * Created by ychuiev001 on 12.06.2019.
 */

@IsTest
private
class TestRestrictContactByName {

    @IsTest static void testInvalid () {
        Contact c = new Contact(LastName = 'INVALIDNAME');

        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(!result.getErrors().isEmpty());
    }
    @IsTest static void generateValid() {
        Contact c = new Contact(LastName = 'Yaroslav');

        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();

        System.assert(result.isSuccess());
        System.assert(result.getErrors().isEmpty());
    }
}