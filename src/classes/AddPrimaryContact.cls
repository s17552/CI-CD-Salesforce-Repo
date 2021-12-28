/**
 * Created by ychuiev001 on 18.06.2019.
 */

public class AddPrimaryContact implements Queueable {

    Contact contact;
    String state;

    public AddPrimaryContact (Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }
    public void execute (QueueableContext param1) {
        List<Account> accs = [
            SELECT Id, BillingState
            FROM Account
            WHERE BillingState = :state
            LIMIT 200
        ];

        List<Contact> contacts = new List<Contact>();
        for (Account acc : accs) {
            Contact newCon = contact.clone(false, false, false, false);
            newCon.AccountId = acc.Id;
            contacts.add(newCon);
        }
        insert contacts;

    }
}