*** Settings ***
Library  SeleniumLibrary
Test Teardown  run keyword if test failed  Log  Screenshot
Resource  ../Resources/Demo_Registration.robot
Library  DataDriver  ../TestData/Demo.xls  sheet_name=Sheet1
Suite Setup  openmyBrowser
Suite Teardown  closingbrowser
Test Template   ToRegister

*** Test Cases ***
Registeringdemowebsite  ${Username}    ${Password}   ${ConfirmPassword}  ${Country}




*** Keywords ***
ToRegister
   click_Register_Link
   [Arguments]  ${Username}    ${Password}   ${ConfirmPassword}  ${Country}
   Input Username  ${Username}
   Input Password1  ${Password}
   Input Password2  ${ConfirmPassword}
   choose_value_from_dropdown  ${Country}
   clicksubmit
   VerifyRegister
