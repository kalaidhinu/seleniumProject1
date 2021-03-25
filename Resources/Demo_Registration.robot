*** Settings ***
Library  SeleniumLibrary
Variables  ../Varaibles/webelements.py

*** Variables ***
${loginurl}
${browser}


*** Keywords ***
openmyBrowser
        [Arguments]  ${loginurl}  ${browser}
        open browser        ${loginurl}     ${browser}
        maximize browser window

click_Register_Link
        click link  ${Register}
        #page should contain  To create your account, we'll need some basic information about you.
        title should be  Register: Mercury Tours
Input Username
    [Arguments]  ${Username}
    #${"email_txt"}    set variable  xpath://input[@id='email']
     element should be visible  ${UN}
     element should be enabled  ${UN}
     input text  ${UN}  ${Username}
Input Password1
      [Arguments]  ${Password}
      #${"email_txt1"}    set variable  xpath://input[@name='password']

     element should be visible  ${PWD}
     element should be enabled  ${PWD}
     input text  ${PWD}  ${Password}
Input Password2
     [Arguments]  ${ConfirmPassword}
   #${"email_txt2"}    set variable  xpath://input[@name='confirmPassword']
    element should be visible  ${ConfirmPWD}
     element should be enabled  ${ConfirmPWD}
     input text  ${ConfirmPWD}  ${ConfirmPassword}
choose_value_from_dropdown
    [Arguments]  ${Country}
     select from list by value  country   ${Country}
clicksubmit
  click button  ${submit}
VerifyRegister
   page should contain  Thank you for registering.
closingbrowser
    close all browsers
