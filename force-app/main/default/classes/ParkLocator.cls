/**
 * Created by ychuiev001 on 19.06.2019.
 */

public with sharing class ParkLocator {

    public static List<String> country (String country){
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        return parks.byCountry(country);
    }
}