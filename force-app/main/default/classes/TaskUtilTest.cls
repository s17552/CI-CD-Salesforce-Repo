/**
 * Created by ychuiev001 on 12.06.2019.
 */

@IsTest
private class TaskUtilTest {
    @IsTest static void testTaskPriority () {
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }

    @IsTest static void testTaskHighPriority () {
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }

    @IsTest static void testTaskPriorityInvalid () {
        String pri = TaskUtil.getTaskPriority('Montana');
        System.assertEquals(null, pri);
    }
}