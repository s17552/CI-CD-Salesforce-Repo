/**
 * Created by ychuiev001 on 11.06.2019.
 */

public with sharing class AccountHandler {
    public static Account insertNewAccount (String accountName) {

        try {
            Account acc = new Account(Name = accountName);
            insert acc;
            return acc;
        } catch (Exception e) {
            System.debug('DEBUG MESSAGE -> ' + e.getMessage());
            return null;
        }
    }
}