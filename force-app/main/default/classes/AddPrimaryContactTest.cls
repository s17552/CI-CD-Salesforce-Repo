/**
 * Created by ychuiev001 on 18.06.2019.
 */
@IsTest
private class AddPrimaryContactTest {

    @TestSetup
    static void setup () {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            String billS = (i >= 50) ? 'NY' : 'CA';
            accounts.add(new Account(
                Name = ('Test acc ' + i),
                BillingState = billS
            ));
        }
        insert accounts;
        insert new Contact(LastName = 'Test');
    }
    @IsTest
    static void test () {
        AddPrimaryContact updater = new AddPrimaryContact([
            SELECT Id, Name, LastName
            FROM Contact
            LIMIT 1
        ], 'CA');
        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();
        System.assertEquals(51, [
            SELECT Id
            FROM Contact
            ].size());
    }
}