/**
 * Created by ychuiev001 on 18.06.2019.
 */

@IsTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @TestSetup
    public static void setup () {
        List<Lead> forInsert = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            forInsert.add(new Lead(
                LastName = ('Test' + i),
                Company = 'PwC',
                LeadSource = ''
            ));
        }
        insert forInsert;
    }

    @IsTest
    public static void test () {
        Test.startTest();
        System.schedule('Schedule daily Lead processor',
            CRON_EXP,
            new DailyLeadProcessor());
        Test.stopTest();

        for (Lead l : [
            SELECT LeadSource
            FROM Lead
        ]) {
            System.assertEquals('Dreamforce',l.LeadSource);
        }

    }
}