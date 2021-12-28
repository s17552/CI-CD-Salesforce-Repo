/**
 * Created by ychuiev001 on 12.06.2019.
 */

public class TaskUtil {
    public static String getTaskPriority(String leadState) {
        // Validate input
        if (String.isBlank(leadState) || leadState.length() > 2) {
            return null;
        }

        String taskPriority;

        if (leadState == 'CA') {
            taskPriority = 'High';
        } else {
            taskPriority = 'Normal';
        }

        return taskPriority;
    }
}