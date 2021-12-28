/**
 * Created by ychuiev001 on 04.07.2019.
 */

trigger ChangeMeetingOwner on Event (after insert, after update) {
/*    Map<Id, List<Event>> contactId2absence = new Map<Id, List<Event>>();
    for (Event e : Trigger.new) {
        if (e.Subject == 'Absence') {
            if (contactId2absence.get(e.WhoId) == null) {
                List<Event> events = new List<Event>();
                contactId2absence.put(e.WhoId, events);
            }
            contactId2absence.get(e.WhoId).add(e);
        }
    }*/
    Event e = Trigger.new[0];
    if (e.Subject == 'Absence') {
        System.debug('YAROSLAV DEBUGS -> ' + 'trigger');
        List<Event> meetings = [
            SELECT Id, StartDateTime, EndDateTime
            FROM Event
            WHERE WhoId = :e.WhoId AND Subject = 'Meeting'
        ];
        for (Event meeting : meetings) {
            if (DateHelper.isDateBetween(e.StartDateTime, e.EndDateTime, meeting.StartDateTime) &&
                DateHelper.isDateBetween(e.StartDateTime, e.EndDateTime, meeting.EndDateTime)) {
                meeting.WhoId = '0032p00002TUx0zAAD';
            }
        }
        update meetings;
    }

}