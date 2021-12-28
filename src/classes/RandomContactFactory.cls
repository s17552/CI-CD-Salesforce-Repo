/**
 * Created by ychuiev001 on 13.06.2019.
 */

public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts (Integer amount, String lastName) {
        List<Contact> forReturn = new List<Contact>();
        for (Integer i = 1; i < amount + 1; i++) {
            forReturn.add(new Contact(FirstName = ('Test ' + i), LastName = lastName));
        }
        return forReturn;
    }
}