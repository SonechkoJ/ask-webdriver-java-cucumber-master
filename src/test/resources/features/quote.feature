#Test Automation Exercise - Cucumber
# https://jira.portnov.com/browse/ACD-575
# Author: Yuliya Demchenko

@cucumber
Feature: Quote Test Scenarios
  Background:
    Given I open url "https://skryabin.com/market/quote.html"
    #For some testcases title page might be commented
    Then I should see page title as "Get a Quote"
    When I resize window to 1920 and 1080

  @cucumber1 @regression
  Scenario: Validating responsive UI behaviour
    #Validate responsive UI behaviour by resizing the browser window and validating some text on the page
    #Given I open url "https://skryabin.com/market/quote.html"
    #Then I should see page title as "Get a Quote"
    #Desktop mode
    When I resize window to 1920 and 1080
    Then element with xpath "//b[@id='location']" should be displayed
    Then element with xpath "//b[@id='location']" should contain text "Los Altos, CA 94022"
    #iPad mode
    When I resize window to 820 and 1180
    Then element with xpath "//b[@id='location']" should be displayed
    Then element with xpath "//b[@id='location']" should contain text "Los Altos, CA 94022"
     #iPhone mode
    When I resize window to 375 and 667
    Then element with xpath "//b[@id='location']" should not be displayed

  @cucumber2
  Scenario: Verify Username field
    #Given I open url "https://skryabin.com/market/quote.html"
    #Then I should see page title as "Get a Quote"
    #When I resize window to 1920 and 1080
    Then I type "A" into element with xpath "//input[@name='username']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should contain text "Please enter at least 2 characters."
    Then I clear element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='username-error']" should contain text "This field is required."
    Then I type "AA" into element with xpath "//input[@name='username']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should not be displayed

  @cucumber3
  Scenario: Verify ”Email” field behavior
    Then I type "12fiEH" into element with xpath "//input[@name='email']"
    And I click on element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='email-error']" should contain text "Please enter a valid email address."
    Then I clear element with xpath "//input[@name='email']"
    Then element with xpath "//label[@id='email-error']" should contain text "This field is required."
    Then I type "123.com" into element with xpath "//input[@name='email']"
    And I click on element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='email-error']" should contain text "Please enter a valid email address."
    Then I clear element with xpath "//input[@name='email']"
    Then element with xpath "//label[@id='email-error']" should contain text "This field is required."
    Then I type "123@dot.com" into element with xpath "//input[@name='email']"
    And I click on element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='email-error']" should not be displayed

  @cucumber4
  Scenario: Verify ”Password” and "Confirm Password" fields behavior
    When I type "1aB" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//input[@id='confirmPassword']"
    Then element with xpath "//label[@id='password-error']" should contain text "Please enter at least 5 characters."
    Then I clear element with xpath "//input[@id='password']"
    Then element with xpath "//label[@id='password-error']" should contain text "This field is required."
    Then I type "Abs156" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//input[@id='confirmPassword']"
    Then element with xpath "//label[@id='password-error']" should not be displayed
    And element with xpath "//input[@id='confirmPassword']" should be enabled
    Then I type "156Abs" into element with xpath "//input[@id='confirmPassword']"
    And I click on element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='confirmPassword-error']" should contain text "Passwords do not match!"
    Then I clear element with xpath "//input[@id='confirmPassword']"
    And I type "Abs156" into element with xpath "//input[@id='confirmPassword']"
    And I click on element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='confirmPassword-error']" should not be displayed
    Then I clear element with xpath "//input[@id='confirmPassword']"
    And I clear element with xpath "//input[@id='password']"
    And I click on element with xpath "//input[@name='username']"
    Then element with xpath "//input[@id='confirmPassword']" should be disabled

  @cucumber5
  Scenario: Verify “Name” field behavior
    When I click on element with xpath "//input[@id='name']"
    Then element with xpath "//div[@id='nameDialog']" should be displayed
    # verify that after putting First Name, Middle Name, Last Name, it concatenates it correctly and puts the value in the Name field
    Then I type "Maria" into element with xpath "//input[@id='firstName']"
    Then I type "Elena" into element with xpath "//input[@id='middleName']"
    Then I type "Wood" into element with xpath "//input[@id='lastName']"
    And I click on element with xpath "//span[text()='Save']"
    Then element with xpath "//input[@value='Maria Elena Wood']" should be present

  @cucumber6
  Scenario: Validate that Accepting Privacy Policy is required to submit the form, then check the field
    When I click on element with xpath "//input[@id='name']"
    Then I click on element with xpath "//input[@id='firstName']"
    Then I type "Maria" into element with xpath "//input[@id='firstName']"
    Then I type "Elena" into element with xpath "//input[@id='middleName']"
    Then I type "Wood" into element with xpath "//input[@id='lastName']"
    And I click on element with xpath "//span[text()='Save']"
    Then I type "Masha" into element with xpath "//input[@name='username']"
    Then I type "123@dot.com" into element with xpath "//input[@name='email']"
    Then I type "Abs156" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='agreedToPrivacyPolicy-error']" should be displayed
    Then I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
    Then element with xpath "//label[@id='agreedToPrivacyPolicy-error']" should not be displayed
    And element with xpath "//span[contains(text(),'I have read and accept Privacy Policy.')]" should be displayed

  @cucumber7
  Scenario: Validate behavior of non-required fields
    #Phone number
    Then I type "1234567890" into element with xpath "//input[@name='phone']"
    #Need help Then I click on element with xpath "//select[@name='countryOfOrigin']"
    Then I click on element with xpath "//input[@value='female']"
    Then I click on element with xpath "//input[@name='allowedToContact']"
    Then I type "12345 Grand Avenue, Los Angeles, California 90210" into element with xpath "//textarea[@id='address']"
    Then I click on element with xpath "//option[@value='BMW']"
    #Need help Then I click on element with xpath "//button[@id='thirdPartyButton']"
    Then I type "01/01/1999" into element with xpath "//input[@id='dateOfBirth']"


  @cucumber8
  Scenario: Verifying that the form is correctly submitted
    When I click on element with xpath "//input[@id='name']"
    Then I click on element with xpath "//input[@id='firstName']"
    Then I type "Maria" into element with xpath "//input[@id='firstName']"
    Then I type "Elena" into element with xpath "//input[@id='middleName']"
    Then I type "Wood" into element with xpath "//input[@id='lastName']"
    And I click on element with xpath "//span[text()='Save']"
    Then I type "Masha" into element with xpath "//input[@name='username']"
    Then I type "123@dot.com" into element with xpath "//input[@name='email']"
    Then I type "Abs156" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
    Then I type "1234567890" into element with xpath "//input[@name='phone']"
    #Need help Then I click on element with xpath "//select[@name='countryOfOrigin']"
    Then I click on element with xpath "//input[@value='female']"
    Then I click on element with xpath "//input[@ng-model='formData.allowedToContact']"
    Then I type "12345 Grand Avenue, Los Angeles, California 90210" into element with xpath "//textarea[@id='address']"
    Then I click on element with xpath "//option[@value='BMW']"
    #Need help!!! Then I click on element with xpath "//button[@id='thirdPartyButton']"
    Then I type "01/01/1999" into element with xpath "//input[@id='dateOfBirth']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//b[text()='Maria Elena Wood']" should be present
    #And element with xpath "//b[text(),'true']" should be present
    And element with xpath "//b[text()='[entered]']" should be present
    And element with xpath "//b[text()='01/01/1999']" should be present
    #And element with xpath "//b[text()='accepted']" should be present
    And element with xpath "//b[text()='female']" should be present
    And element with xpath "//b[text()='BMW']" should be present








    
    
    