/**
 * Created by ychuiev001 on 12.06.2019.
 */

public with sharing class ContactAndLeadSearch {

    public static List <List<SObject>> searchContactsAndLeads (String s) {
        List<List<sObject>> searchList = [
            FIND 'Smith'
            IN NAME FIELDS
                RETURNING Lead(Id, Name), Contact(Id, Name)
        ];
        return searchList;
    }

}