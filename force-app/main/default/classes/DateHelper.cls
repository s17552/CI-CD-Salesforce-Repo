/**
 * Created by ychuiev001 on 04.07.2019.
 */

public with sharing class DateHelper {

    public static Boolean isDateBetween (Datetime startDate, Datetime endDate, Datetime dateForCheck) {
        return dateForCheck > startDate && dateForCheck < endDate;
    }
}