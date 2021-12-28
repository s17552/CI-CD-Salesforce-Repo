/**
 * Created by ychuiev001 on 11.06.2019.
 */
public with sharing class StringArrayTest {

    public static List<String> generateStringArray(Integer amount) {
        List<String> strings = new List<String>();

        for (Integer i = 0; i < amount; i++) {
            strings.add('Test ' + i);
        }

        for (Integer i = 0; i < strings.size(); i++) {
            System.debug('DEBUG MESSAGE -> ' + strings.get(i));
        }
        return strings;

    }
}