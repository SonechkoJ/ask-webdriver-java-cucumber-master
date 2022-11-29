#Task ACD-543
#Automate search for the following search engines:
# Author: Yuliya Demchenko

@predefined
Feature: Regression for search engines

  @prededined1
  Scenario: Search engine via Gibiru
    Given I open url "https://gibiru.com"
    Then I should see page title contains "Gibiru"
    Then element with xpath "//input[@id='q']" should be present
    When I type "cucumber testing" into element with xpath "//input[@id='q']"
    Then I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//div[@id='web-results']" to be present
    Then element with xpath "//div[@id='web-results']" should contain text "cucumber testing"
    Then I wait for 3 sec

  @prededined2
  Scenario: Search engine via DuckDuckGo
    Given I open url "https://duckduckgo.com"
    Then I should see page title contains "DuckDuckGo"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Cucumber and Selenium" into element with xpath "//input[@name='q']"
    And I click on element with xpath "//input[@id='search_button_homepage']"
    Then I wait for element with xpath "//div[@id='links']" to be present
    Then element with xpath "//div[@id='links']" should contain text "cucumber and Selenium"
    Then I wait for 3 sec

  @prededined3
  Scenario: Search engine via Swisscows
    Given I open url "https://swisscows.com"
    Then I should see page title contains "Swisscows"
    Then element with xpath "//input[@placeholder='Your search. Your business.']" should be present
    When I type "Swiss cheese" into element with xpath "//input[@placeholder='Your search. Your business.']"
    And I click on element with xpath "//button[@class='search-submit']"
    Then I wait for element with xpath "//div[@class='row row-page-results']" to be present
    Then element with xpath "//div[@class='row row-page-results']" should contain text "Swiss cheese"
    Then I wait for 3 sec

  @prededined4
  Scenario: Search engine via Search Encrypt
    Given I open url "https://www.searchencrypt.com"
    Then I should see page title contains "Search Encrypt"
    Then element with xpath "//input[@name='q']" should be present
    When I type "rest api examples" into element with xpath "//input[@name='q']"
    And I click on element with xpath "//button[@class='search-bar__submit']"
    Then I wait for element with xpath "//section[@class='serp__results container']" to be present
    Then element with xpath "//section[@class='serp__results container']" should contain text "REST API examples"
    Then I wait for 3 sec

  @prededined5
    #Help needed!!!
  Scenario: Search engine via Startpage
    Given I open url "https://www.startpage.com"
    Then I should see page title contains "Startpage"
    Then element with xpath "//input[@id='q']" should be present
    When I type "Automation testing" into element with xpath "//input[@id='q']"
    And I click on element with xpath "//div[@class='x-btn-container']/following-sibling::button[1]"
    Then I wait for element with xpath "//iframe[@id='master-1']" to be present
    Then element with xpath "//iframe[@id='master-1']" should contain text "Automation testing"
    Then I wait for 3 sec

  @prededined6
  Scenario: Search engine via Yandex
    Given I open url "https://www.yandex.com"
    Then I should see page title contains "Yandex"
    Then element with xpath "//input[@id='text']" should be present
    When I type "Java language" into element with xpath "//input[@id='text']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//ul[@id='search-result']" to be present
    Then element with xpath "//ul[@id='search-result']" should contain text "Java language"
    Then I wait for 3 sec

  @prededined7
  Scenario: Search engine via Ecosia
    Given I open url "https://www.ecosia.org"
    Then I should see page title contains "Ecosia"
    Then element with xpath "//input[@name='q']" should be present
    When I type "organic food" into element with xpath "//input[@name='q']"
    And I click on element with xpath "//button[@data-test-id='search-form-submit']"
    Then I wait for element with xpath "//div[@class='meta-results']/following-sibling::div[1]" to be present
    Then element with xpath "//div[@class='meta-results']/following-sibling::div[1]" should contain text "organic food"
    Then I wait for 3 sec

  @prededined8
    #need help!!!
  Scenario: Search engine via WIKI
    Given I open url "https://www.wiki.com/"
    Then I should see page title contains "Wiki.com"
    Then element with xpath "input[name='q']" should be present
    When I type "Chicago museums" into element with xpath "input[name='q']"
    And I click on element with xpath "input[value='Wiki Search']"
    Then I click on element with xpath "<string>"

  @prededined9
  Scenario: Search engine via giveWater
    Given I open url "https://www.givewater.com/"
    Then I should see page title contains "Give Clean Water to Those"
    Then element with xpath "//input[@id='site-search']" should be present
    When I type "Nigeria water resources" into element with xpath "//input[@id='site-search']"
    And I click on element with xpath "//button[@class='btn-search']"
    Then I wait for element with xpath "//div[@class='web-bing']" to be present
    Then element with xpath "//div[@class='web-bing']" should contain text "Nigeria water resources"
    Then I wait for 3 sec

  @prededined10
  Scenario: Search engine via ekoru
    Given I open url "https://ekoru.org/"
    Then I should see page title contains "Ekoru"
    Then element with xpath "//input[@id='fld_q']" should be present
    When I type "russian ecology" into element with xpath "//input[@id='fld_q']"
    And I click on element with xpath "//div[@id='btn_search']"
    Then I wait for element with xpath "//div[@id='serp_organic']" to be present
    Then I wait for 3 sec
    Then element with xpath "//div[@id='serp_organic']" should contain text "russian ecology"

