/**
 * Created by ychuiev001 on 12.06.2019.
 */

trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> tasks = new List<Task>();

    for (Opportunity o : Trigger.new) {
        if (o.StageName == 'Closed Won') {
            tasks.add(new Task(
                    Subject = 'Follow Up Test task',
                    WhatId = o.Id
                )
            );

        }
    }
    insert tasks;
}