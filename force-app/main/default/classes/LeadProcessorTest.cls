/**
 * Created by ychuiev001 on 18.06.2019.
 */
@IsTest
private class LeadProcessorTest {

    @TestSetup
    static void setup () {
        List<Lead> forInsert = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            forInsert.add(new Lead(
                LastName = ('Test' + i),
                Company = 'PwC'
            ));
        }

        insert forInsert;
    }


    @IsTest
    static void test () {
        Test.startTest();
            LeadProcessor lp = new LeadProcessor();
            Database.executeBatch(lp);
        Test.stopTest();

        for (Lead l : [SELECT Id, LeadSource FROM Lead]){
            System.assertEquals('Dreamforce', l.LeadSource);
        }

    }
}