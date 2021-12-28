/**
 * Created by ychuiev001 on 17.06.2019.
 */

public with sharing class AccountProcessor {

    @Future
    public static void countContacts (List<Id> accounts) {
        List<Account> forUpdate = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id IN :accounts];
        List<Contact> contacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accounts];
        Map<Id, Account> id2Account = new Map<Id, Account>();

        for (Account a : forUpdate) {
            id2Account.put(a.Id, a);
        }
        for (Contact c : contacts) {
            id2Account.get(c.AccountId).Number_of_Contacts__c++;
        }
        update forUpdate;
    }
}