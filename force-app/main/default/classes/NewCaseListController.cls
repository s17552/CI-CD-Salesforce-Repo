/**
 * Created by ychuiev001 on 14.06.2019.
 */

public class NewCaseListController {

    public List<Case> cases { get; set; }

    public NewCaseListController () {
        cases = getNewCases();
    }
    public List<Case> getNewCases () {
        return [
            SELECT Id, CaseNumber
            FROM Case
            WHERE Status = 'New'
        ];
    }
}