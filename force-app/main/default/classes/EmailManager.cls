/**
 * Created by ychuiev001 on 11.06.2019.
 */

public class EmailManager {
    // Public method
    public static void sendMail(String [] addresses, String [] subjects, String [] messages) {
        Messaging.SingleEmailMessage [] emails = new Messaging.SingleEmailMessage[]{};
        Integer totalMails = addresses.size();
        for(Integer i=0; i < totalMails; i++){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject(subjects[i]);
            email.setToAddresses(new List<String> { addresses[i] });
            email.setPlainTextBody(messages[i]);
            emails.add(email);
        }
        Messaging.sendEmail(emails);
    }

    // Helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results.
        // In this class, the methods send only one email,
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());
            }
        }

        return sendResult;
    }
}