/**
 * Created by ychuiev001 on 19.06.2019.
 */
@IsTest
private class AccountManagerTest {

    @IsTest
    static void test(){

        Account a = new Account(Name = 'Test',Phone = '+489888888');
        insert a;
        insert new Contact(LastName = 'TEST1', AccountId = a.Id);
        insert new Contact(LastName = 'TEST2', AccountId = a.Id);

        RestRequest request = new RestRequest();
        request.requestURI =
            'https://eu26.lightning.force.com/services/apexrest/Accounts/'
                + a.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account thisAcc= AccountManager.getAccount();
        // Verify results
        System.assert(thisAcc != null);
        System.assertEquals('Test', thisAcc.Name );
        System.assertEquals('TEST1', thisAcc.Contacts.get(0).Name);
        System.assertEquals('TEST2', thisAcc.Contacts.get(1).Name);

    }
}