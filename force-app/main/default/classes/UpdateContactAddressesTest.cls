/**
 * Created by ychuiev001 on 18.06.2019.
 */

@IsTest
private class UpdateContactAddressesTest {
    @TestSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            accounts.add(new Account(Name='Account '+i,
                BillingCity='New York', BillingCountry='USA'));
        }
        insert accounts;
        // find the account just inserted. add contact for each
        for (Account account : [SELECT Id FROM Account]) {
            contacts.add(new Contact(FirstName='first',
                LastName='last', AccountId=account.Id));
        }
        insert contacts;
    }
    static testMethod void test() {
        Test.startTest();
        UpdateContactAddresses uca = new UpdateContactAddresses();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [SELECT COUNT() FROM Contact WHERE MailingCity = 'New York']);
    }

}