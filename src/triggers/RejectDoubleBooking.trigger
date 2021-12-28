/**
 * Created by ychuiev001 on 12.07.2019.
 */

trigger RejectDoubleBooking on Session_Speaker__c (before insert, before update) {
    //collect ID's to reduce data calls
    List<Id> speakerIds = new List<Id>();
    Map<Id,Datetime> requested_bookings = new Map<Id,Datetime>();
    //get all speakers related to the trigger
    //set booking map with ids to fill later
    for(Session_Speaker__c newItem : Trigger.new) {
        requested_bookings.put(newItem.Session__c,null);
        speakerIds.add(newItem.Speaker__c);
    }
    //fill out the start date/time for the related sessions
    List<Session__c> related_sessions = [SELECT Id, Session_Date__c FROM Session__c WHERE Id IN :requested_bookings.keySet()];
    for(Session__c related_session : related_sessions) {
        requested_bookings.put(related_session.Id,related_session.Session_Date__c);
    }
    //get related speaker sessions to check against
    List<Session_Speaker__c> related_speakers = [SELECT Id, Speaker__c, Session__c, Session__r.Session_Date__c FROM Session_Speaker__c WHERE Speaker__c IN :speakerIds];
    //check one list against the other
    for(Session_Speaker__c requested_session_speaker : Trigger.new) {
        Datetime booking_time = requested_bookings.get(requested_session_speaker.Session__c);
        for(Session_Speaker__c related_speaker : related_speakers) {
            if(related_speaker.Speaker__c == requested_session_speaker.Speaker__c &&
                related_speaker.Session__r.Session_Date__c == booking_time) {
                requested_session_speaker.addError('The speaker is already booked at that time');
            }
        }
    }
}