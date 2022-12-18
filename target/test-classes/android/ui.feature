Feature: browser automation 1

  Background:
    #* configure driver = { type: 'msedge', showDriverLog: true }
   # * configure driver = { type: 'msedge',executable: '/Users/impadmin/Desktop/karate/chromedriver' }
    * def driverConfig = { type: 'chrome',executable: '/Applications/Google Chrome.app', showDriverLog: true, addOptions: [ "--disable-extensions" ], webDriverSession: { desiredCapabilities: { browserName: 'chrome', "google:chromeOptions": { useAutomationExtension: true } } } }
    * configure driver = driverConfig
  Scenario: try to login to patient keeper web application

    Given driver 'http://eng-vm-mob08.patientkeeper.com'
    * delay(3000)
    And driver.maximize()
    And switchFrame("[name='workspace']")
    And input("//input[@id='UserName']", "pkdev0")
    * delay(1000)
    And input("//input[@name='PassWord']", "123")
    * delay(1000)
    And click("//*[text()='Login' and contains(@class, 'button-base')]")
    * delay(30000)
    And switchPage(2)
    * delay(30000)
    * print driver.title
    * match driver.title =='Web BrandingTitle     User: pkdev0 (0)'