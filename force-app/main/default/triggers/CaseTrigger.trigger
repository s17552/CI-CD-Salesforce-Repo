trigger CaseTrigger on Case (after insert) {
    List<Case> casesList = Trigger.new;
    List<Lead> leadsList = new List<Lead>();
    
    for(Case c : casesList){
        Lead lead = new Lead(
            FirstName = c.First_name__c,
            LastName = c.Last_name__c
        );
        leadsList.add(lead);
    }
    insert leadsList;
    
}