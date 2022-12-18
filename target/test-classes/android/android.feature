Feature: android test

  Background: App Preset
    * configure driver = { type: 'android', webDriverPath : "/wd/hub", start: false, httpConfig : { readTimeout: 120000 }}

  Scenario: android mobile app UI tests
    Given driver { webDriverSession: { desiredCapabilities : "#(android.desiredConfig)"} }
    * def elementExists =  optional('#com.patientkeeper.app.android.patientkeeper:id/hostAddressField').present
    * print elementExists
    * def a = elementExists == true? driver.click("#com.patientkeeper.app.android.patientkeeper:id/hostAddressField") : driver.click("#com.patientkeeper.app.android.patientkeeper:id/hostNameFieldTextView")
    And driver.clear('#com.patientkeeper.app.android.patientkeeper:id/hostAddressField').input("eng-vm-mob08.patientkeeper.com")
    And driver.clear('#com.patientkeeper.app.android.patientkeeper:id/userNameField')
    And driver.click('#com.patientkeeper.app.android.patientkeeper:id/userNameField').input("patientsafety")
    And driver.click('#com.patientkeeper.app.android.patientkeeper:id/passwordField').input("123")
    And driver.click('#com.patientkeeper.app.android.patientkeeper:id/login_button')
    And retry(10,10000).waitFor("//android.widget.ImageView[@content-desc='More options']")
    And driver.click("//android.widget.TextView[contains(@text, 'PK, BLUE')]")
    Then match driver.text('#com.patientkeeper.app.android.patientkeeper:id/patientsummary_name') == "PK, BLUE"





  #And waitForEnabled("//android.widget.ImageView[@content-desc='More options']")
  #com.patientkeeper.app.android.patientkeeper:id/hostAddressField
  #com.patientkeeper.app.android.patientkeeper:id/hostNameFieldTextView
  #com.patientkeeper.app.android.patientkeeper:id/userNameField
  #com.patientkeeper.app.android.patientkeeper:id/passwordField
  #com.patientkeeper.app.android.patientkeeper:id/login_button

#And driver.input('userNameField').input("pkdev")
#    And driver.click('#com.bs.droidaction:id/showTextCheckBox')
#    And retry(10, 1000).waitForAny("#com.bs.droidaction:id/nameTextView", "//android.widget.TextView[@text='KarateDSL']")
#    Then match driver.text('#com.bs.droidaction:id/nameTextView') == 'KarateDSL'
#    And driver.click('#com.bs.droidaction:id/showTextCheckBox')
#    And assert (optional('#com.bs.droidaction:id/nameTextView').present != true)
