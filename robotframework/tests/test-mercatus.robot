*** Settings ***
Library  AppiumLibrary
Library  BuiltIn
Library  String
Library  OperatingSystem
Test Teardown  Close Application

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/../../apps/ApiDemos.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8.0}
${ANDROID_APP_PACKAGE}        io.appium.android.apis
${ANDROID_DEVICE_NAME}        %{ANDROID_DEVICE_NAME=Nexus S API 26}
${EXECUTOR}                   http://127.0.0.1:4723/wd/hub


*** Test Cases ***
Mobile Test
  Set Local Executor
  Open Android Test App
  Navegate to App
  Navegate to Activity
  Navegate to Hello-Word
  Check Text Hello-world

*** Keywords ***
Set Local Executor
  return from keyword  http://127.0.0.1:4723/wd/hub

Open Android Test App
  [Arguments]    ${appActivity}=${EMPTY}
  #${executor}  set executor
  open application  ${executor}  automationName=${ANDROID_AUTOMATION_NAME}
  ...  app=${ANDROID_APP}  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  appActivity=${appActivity}
  ...  deviceName=${ANDROID_DEVICE_NAME}

Navegate to App
  Wait Until Page Does Not Contain  //*[@text='App']
  click element    //*[@text='App']
Navegate to Activity
  Wait Until Page Does Not Contain  //*[@text='Activity']
  click element    //*[@text='Activity']
Navegate to Hello-Word
  Wait Until Page Does Not Contain  //*[@text='Hello World']
  click element    //*[@text='Hello World']
Check Text Hello-world
  Wait Until Page Does Not Contain  //*[@content-desc='Hello, World!']
  element should contain text  //*[@content-desc='Hello, World!']  Hello, World!
	
