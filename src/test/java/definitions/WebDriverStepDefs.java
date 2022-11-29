package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;
import static support.TestContext.getDriver;


public class WebDriverStepDefs {
    @Given("I navigate to {string}")
    public void iNavigateTo(String sURL) {
        //getDriver().get("https://www.google.com/");
        switch (sURL) {
            case "Google":
                getDriver().get("https://www.google.com/");
                break;
            case "quote":
                getDriver().get("https://skryabin.com/market/quote.html");
                break;
            case "amazon":
                getDriver().get("https://www.amazon.com/");
            default:
                System.out.println("No URL found");
        }
    }

    @Then("I print page details")
    public void iPrintPageDetails() {
        System.out.println(getDriver().getTitle());
        System.out.println(getDriver().getCurrentUrl());
        System.out.println(getDriver().getWindowHandle());
    }

    @When("I type {string} into email field")
    public void iTypeIntoEmailField(String sEmail) {
        getDriver().findElement(By.xpath("//input[@name='email']")).sendKeys(sEmail);
    }

    @And("I click Submit button")
    public void iClickSubmitButton() {
        getDriver().findElement(By.xpath("//button[@id='formSubmit']")).click();
    }


    @Then("error message {string} should be displayed")
    public void errorMessageShouldBeDisplayed(String sMessage) {
        String sActualMessage = getDriver().findElement(By.xpath("//label[@id='email-error']")).getText();
        System.out.println("Actual message is " + sActualMessage);
        assertThat(sActualMessage.equals(sMessage)).isTrue();

    }

    @Then("I clean text in email field")
    public void iCleanTextInEmailField() {
        getDriver().findElement(By.xpath("//input[@name='email']")).clear();
    }

    @Then("no error message should be displayed for email field")
    public void noErrorMessageShouldBeDisplayedForEmailField() {
        /*Boolean Text = getDriver().findElement(By.xpath("//label[@id='email-error']")).isDisplayed();
        assertThat(Text).isFalse();*/

        assertThat(getDriver().findElement(By.xpath("//label[@id='email-error']")).isDisplayed()).isFalse();

    }

    //@Then("no error message should be displayed")
    //public void noErrorMessageShouldBeDisplayed() {
        //Boolean Text = getDriver().findElement(By.xpath("//label[@id='email-error']")).isDisplayed();

    //}

    @Then("take a break")
    public void takeABreak()  throws Exception{
        Thread.sleep(5000);

    }
    @When("I click on Name field")
    public void iClickOnNameField() {
        getDriver().findElement(By.xpath("//input[@id='name']")).click();
    }

    @Then("I open Name dialog window")
    public void iOpenNameDialogWindow() {
        getDriver().findElement(By.xpath("//div[@id='nameDialog']")).isDisplayed();
        String sName = getDriver().findElement(By.xpath("//span[@class='ui-dialog-title'])")).getText();
        assertThat(sName.equals("Name")).isTrue();
    }

    @Then("I type {string} as First Name {string} as Middle Name {string} as Last Name and validate that Name is {string}")
    public void iTypeAsFirstNameAsMiddleNameAsLastNameAndValidateThatNameIs(String sFirstName, String sMiddleName, String sLastName, String sName) {
        getDriver().findElement(By.xpath("//input[@id='firstName']")).sendKeys(sFirstName);
        getDriver().findElement(By.xpath("//input[@id='middleName']")).sendKeys(sMiddleName);
        getDriver().findElement(By.xpath("//input[@id='lastName']")).sendKeys(sLastName);
        getDriver().findElement(By.xpath("//span[contains(text(),'Save')]")).click();
        String sActualName = sFirstName + " " + sMiddleName + " " + sLastName;
        System.out.println("sActualName" + sActualName);
        System.out.println("sName" + sName);
        Boolean isPresent = getDriver().findElement(By.xpath("//input[@id='name' and @value='" + sActualName + "']")).isDisplayed();
        System.out.println("isPresent" + isPresent);
        assertEquals(true, isPresent);

    }


}
