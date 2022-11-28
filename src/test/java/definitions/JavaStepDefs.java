package definitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

import java.util.Locale;

public class JavaStepDefs {
    @Given("I print Hello World")
    public void iPrintHelloWorld() {
        System.out.println("Hello World");
    }

    @Given("I print {string}")
    public void iPrint(String sString) {
        System.out.println(sString);
    }

    @Given("I print {string} and {string} and {string}")
    public void iPrintAndAnd(String sString1, String sString2, String sString3) {
        String sSpace = " ";
        String sExMark = "!";
        System.out.println(sString1+sString2+sString3);
        System.out.println(sString1+" "+sString2+" "+sString3);
        System.out.println(sString1+sSpace+sString2+sSpace+sString3+sExMark);
        System.out.println(sString1+sSpace+sString2+sSpace+sString3.toUpperCase(Locale.ROOT)+sExMark);
    }

    @Given("I work with number {int} and number {int}")
    public void iWorkWithNumberAndNumber(int iNum1, int iNum2) {
        int iSum =iNum1 + iNum2;
        int iDif =iNum1 - iNum2;
        int iPro =iNum1 * iNum2;
        float iDiv =iNum1 / iNum2;
        System.out.println(iNum1 + "+" + iNum2 + "=" + iSum);
        System.out.println("The difference between " + iNum1 + " and " + iNum2 + " is " + iDif);
        System.out.println(iPro);
        System.out.println("Division " + iDiv);
    }

    @Then("I identify that the number {int} is odd or even")
    public void iIdentifyThatTheNumberIsOddOrEven(int iNum) {
        if (iNum%2 == 0){
            System.out.println(iNum +" is even number");
        }
        else {
            System.out.println(iNum +" is odd number");

        }
    }

    @Given("I want to print days of the week")
    public void iWantToPrintDaysOfTheWeek() {
        String[] aDaysOfWeek ={"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
        int[] aDateOfWeek = {20,21,22,23,24,25,26};
            System.out.println(aDaysOfWeek[3]);
        for (String element:aDaysOfWeek) {
            System.out.println(element);
        }
        for (int i=0; i<=aDateOfWeek.length; i++)
            System.out.println(aDaysOfWeek[i] + " " + aDateOfWeek[i]);}
}
