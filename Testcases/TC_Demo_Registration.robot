*** Settings ***
Library  SeleniumLibrary
Test Teardown  run keyword if test failed  Log  Screenshot
Resource  ../Resources/Demo_Registration.robot
Library  DataDriver  ../TestData/Demo.xls  sheet_name=Sheet1
Test Template   Toopenbrowser


*** Test Cases ***
Run






*** Keywords ***
Toopenbrowser
  [Arguments]  ${loginurl}  ${browser}  ${Username}    ${Password}   ${ConfirmPassword}  ${Country}
     openmyBrowser   ${loginurl}     ${browser}
     ${demosite}=  get element count  xpath://img[@alt='Guru99 Demo Sites']
     run keyword if    ${demosite}>0   click_Register_Link    ELSE    closingbrowser
     ToRegister  ${Username}    ${Password}   ${ConfirmPassword}  ${Country}

ToRegister
   [Arguments]  ${Username}    ${Password}   ${ConfirmPassword}  ${Country}
   Input Username  ${Username}
   Input Password1  ${Password}
   Input Password2  ${ConfirmPassword}
   choose_value_from_dropdown  ${Country}
   clicksubmit
   VerifyRegister
   closingbrowser


