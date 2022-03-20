/**
 * Created by yaroslav.chuiev on 11/08/2021.
 */

@IsTest
public class AccountTriggerHelperTest {

    @TestSetup
    static void setup() {

        Account accountWithTypeOther = new Account();
        accountWithTypeOther.Name = 'Test 123';
        accountWithTypeOther.Type = 'Other';
        accountWithTypeOther.Phone = '+48123123123123';
        insert accountWithTypeOther;

        Account accountWithTypeProspect = new Account();
        accountWithTypeProspect.Name = 'Test 123';
        accountWithTypeProspect.Type = 'Prospect';
        accountWithTypeProspect.Phone = '+48123123123123';
        insert accountWithTypeProspect;

    }

    @IsTest
    static void updateTypeTest() {
        List<Account> accounts = [
            SELECT Id,Type,Industry FROM Account
        ];

        for (Account acc : accounts) {
            if (acc.Type == 'Other') {
//                System.assertEquals('Other', acc.Industry);
            }
        }
    }
}