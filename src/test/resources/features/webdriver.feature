#Exercise for Selenium WebDriver
#Author: Julia Demchenko
@webdriber
Feature: Exercise for Selenium WebDriver

  Background: Given I navigate to "quote"

@webdriver1
Scenario: Open URL using site name and print page details
  Given I navigate to "quote"
  Then I print page details

@webdriver2
Scenario: Email field validation
  When I type "abc" into email field
  And I click Submit button
  Then error message "Please enter a valid email address." should be displayed
  Then I clean text in email field
  Then error message "This field is required." should be displayed
  Then I type "abc@abc.com" into email field
  Then no error message should be displayed for email field
  Then take a break

@webdriver3
Scenario: Name field validation
  When I click on Name field
  Then I open Name dialog window
  Then I type "A" as First Name "B" as Middle Name "C" as Last Name and validate that Name is "A B C"
  Then take a break

