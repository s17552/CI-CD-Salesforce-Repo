/**
 * Created by ychuiev001 on 19.06.2019.
 */

@RestResource(UrlMapping='/Accounts/*/contacts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount () {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(
            request.requestURI.remove('/contacts').lastIndexOf('/') + 1);
        accountId = accountId.remove('/contacts');

        System.debug('YAROSLAV DEBUGS -> ' + accountId);
        return [
            SELECT Id, Name, (
                SELECT Id, Name
                FROM Contacts
                WHERE AccountId = :accountId
            )
            FROM Account
            WHERE Id = :accountId
        ];
    }

}