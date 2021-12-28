/**
 * Created by ychuiev001 on 12.06.2019.
 */

@IsTest
private class TestVerifyDate {
    @IsTest static void generateLastMonthDay () {

        Date date1 = Date.newInstance(2000,10,10);
        Date date2 = date1.addDays(40);

        Date actualDate = VerifyDate.CheckDates(date1,date2);
        Date expectedDate = Date.newInstance(2000,10,31);
        System.assertEquals(expectedDate,actualDate);
    }

    @IsTest static void generateDate2() {

        Date date1 = Date.newInstance(2000,10,10);
        Date date2 = Date.newInstance(2000,10,30);

        Date expectedDate = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, expectedDate);
    }
    @IsTest static void generateWrongData() {

        Date date1 = Date.newInstance(2000,10,10);
        Date date2 = Date.newInstance(2000,1,30);

        Date expectedDate = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(Date.newInstance(2000,10,31), expectedDate);
    }
}