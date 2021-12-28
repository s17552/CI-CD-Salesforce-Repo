/**
 * Created by yaroslav.chuiev on 11/08/2021.
 */

public with sharing class AccountTriggerHelper {
    public static void updateType(List<Account> accounts) {
        for (Account acc : accounts) {
            if (acc.Type == 'Other') {
                acc.Industry = 'Prospect';
            }
        }
    }

    public static void updateActiveStatus(List<Account> accounts) {
        for (Account acc : accounts) {
            acc.Active__c = 'Yes';
        }
    }
}