/**
 * Created by yaroslav.chuiev on 11/08/2021.
 */

trigger AccountTrigger on Account (before insert, before update) {

    if (Trigger.isInsert) {
        AccountTriggerHelper.updateType(Trigger.new);
    }
    if (Trigger.isUpdate) {
        AccountTriggerHelper.updateActiveStatus(Trigger.new);
    }
}