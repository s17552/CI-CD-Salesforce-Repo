/**
 * Created by ychuiev001 on 14.06.2019.
 */

public class ContactsListController {
    private String sortOrder = 'LastName';

    public List<Contact> getContacts () {

        List<Contact> results = Database.query(
            'SELECT Id, FirstName, LastName, Title, Email ' +
                'FROM Contact ' +
                'ORDER BY ' + sortOrder + ' ASC ' +
                'LIMIT 10'
        );
        System.debug('DEBUG MESSAGE -> ' + 'calling method in controller');
        return results;
    }
    public void sortByLastName() {
        this.sortOrder = 'LastName';
    }

    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
    }
}