/**
 * Created by ychuiev001 on 12.06.2019.
 */

trigger HelloWorldTrigger on Account (before insert) {
    System.debug('DEBUG MESSAGE -> ' + 'HELLO WORLD!');
}