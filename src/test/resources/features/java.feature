#Java practice
# Author: Yuliya Demchenko
@Java
Feature: Java practice
  @Java1
  Scenario: Hello World
    Given I print Hello World
  @Java
  Scenario: Print a string
    Given I print "Hello World"
    Then I print "Happy Thanksgiving!"
  @Java3
  Scenario: Print 3 string
    Given I print "This" and "is a" and "good day"
  @Java4
  Scenario: Practice with numbers
    Given I work with number 10 and number 3
  #Conditions
    Then I identify that the number 10 is odd or even
    Then I identify that the number 7 is odd or even

  #Arrays
  @Java5
  Scenario: Practice with Arrays
    Given I want to print days of the week
