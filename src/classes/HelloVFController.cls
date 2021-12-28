public with sharing class HelloVFController {
    public String firstName { get; set; }
    public Contact fakeContact { get; set; }
    public Decimal age { get; private set; }

    public HelloVFController (ApexPages.StandardController stdController) {
        this.fakeContact = (Contact) stdController.getRecord();
    }

    public PageReference calculate () {
        age = fakeContact != null && fakeContact.Birthdate != null
            ? System.today().year() - fakeContact.Birthdate.year()
            : 0;

        return null;
    }
}