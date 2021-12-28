/**
 * Created by ychuiev001 on 01.07.2019.
 */

trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> tasks = new List<Task>();
    for (Order_Event__e orderEvent : Trigger.New) {
        if (orderEvent.Has_Shipped__c == true) {
            Task ts = new Task(
                Priority = 'Medium',
                Subject =  'Follow up on shipped order ' + orderEvent.Order_Number__c,
                OwnerId = orderEvent.CreatedById
            );
            tasks.add(ts);
        }
    }
    insert tasks;
}