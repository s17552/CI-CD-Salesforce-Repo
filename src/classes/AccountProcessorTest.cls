/**
 * Created by ychuiev001 on 17.06.2019.
 */
@IsTest
private class AccountProcessorTest {

    @IsTest
    private static void test () {

        Account a = new Account(Name = 'Chuiev', Number_of_Contacts__c = 0);
        Account a1 = new Account(Name = 'Chuiev1', Number_of_Contacts__c = 0);
        insert new List<Account> {a, a1};
        Contact c = new Contact(LastName = 'Chuiev', AccountId = a.Id);
        insert c;

        List<Id> ids = new List<Id> {a.Id,a1.Id};

        Test.startTest();
        AccountProcessor.countContacts(ids);
        Test.stopTest();

        a = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :a.Id LIMIT 1];
        System.assertEquals(1,a.Number_of_Contacts__c);
    }
}