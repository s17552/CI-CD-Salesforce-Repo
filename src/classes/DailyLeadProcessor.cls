/**
 * Created by ychuiev001 on 18.06.2019.
 */

public with sharing class DailyLeadProcessor implements Schedulable {

    public DailyLeadProcessor(){

    }
    public void execute (SchedulableContext param1) {
        List<Lead> forUpdate = new List<Lead>();
        for (Lead l : [
            SELECT Id, LeadSource
            FROM Lead
            WHERE LeadSource = ''
            LIMIT 200
        ]) {
            l.LeadSource = 'Dreamforce';
            forUpdate.add(l);
        }
        update forUpdate;
    }
}