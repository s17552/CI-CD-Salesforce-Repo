public with sharing class ContactSearch {
    public static List<Contact> searchForContacts (String lastName, String postCode) {
        String name = '%' + lastName;
        List<Contact> contacts = [
            SELECT Id, Name
            FROM Contact
            WHERE Name LIKE :name AND
            MailingPostalCode LIKE :postCode
        ];
        return contacts;
    }
}