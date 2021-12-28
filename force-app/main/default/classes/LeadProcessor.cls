/**
 * Created by ychuiev001 on 18.06.2019.
 */

global class LeadProcessor implements Database.Batchable<SObject> {

    private static Integer recChanged = 0;
    global void execute (Database.BatchableContext param1, List<Lead> leadsForUpdate) {
        List<Lead> leads = new List<Lead>();
        for (Lead lead : leadsForUpdate) {
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
            recChanged++;
        }
        update leads;
    }


    global void finish (Database.BatchableContext param1) {
        EmailManager.sendMail('yaroslav.chuiev@pwc.com', 'Recs', 'Rec changed: ' + recChanged);
    }

    global Database.QueryLocator start (Database.BatchableContext param1) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }
}