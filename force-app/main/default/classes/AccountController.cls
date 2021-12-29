public with sharing class AccountController {
  public static List<Account> getAllActiveAccounts() {
    System.debug('YC Debug--' +'1');
    return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
  }
}