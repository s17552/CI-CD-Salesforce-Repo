/**
 * Created by ychuiev001 on 19.06.2019.
 */

public class AwesomeCalculator {
    public static Double add(Double x, Double y) {
        calculatorServices.CalculatorImplPort calculator =
            new calculatorServices.CalculatorImplPort();
        return calculator.doAdd(x,y);
    }
}