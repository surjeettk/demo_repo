
function fn() {
  var config = {}
  var android = {}

  android["desiredConfig"] = {
//   "app" : "https://github.com/babusekaran/droidAction/raw/main/build/UiDemo.apk",
   "app" : "/Users/pk/Desktop/Payload/PK-R-2022.4-904002207-normal-debug.apk",
  // "app" : "/Users/impadmin/Desktop/Payload/PK9.app",
   "newCommandTimeout" : 300,
   "platformVersion" : "12",
   "platformName" : "Android",
   //"platformName" : "IOS",
   "connectHardwareKeyboard" : true,
   "deviceName" : "emulator-5554",
   "automationName" : "UiAutomator2",
    //"automationName" : "XCUITest",
   // "bundleId" : "com.patientkeeper.pk9",
   "noReset" : "true"
  }
  config["android"] = android
  return config;
}

