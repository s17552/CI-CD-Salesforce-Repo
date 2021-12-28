public class LeadFormController {

    @AuraEnabled
    public static List<Lead> getAllLeads(){
        return [SELECT id, FirstName, LastName, Company FROM LEAD];
    }
}