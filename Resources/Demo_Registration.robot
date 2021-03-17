*** Settings ***
Library  SeleniumLibrary
#Variables  ../Variables/Variables.py


*** Variables ***
${loginurl}  http://demo.guru99.com/test/newtours/
${browser}  chrome

*** Keywords ***
openmyBrowser
        open browser        ${loginurl}     ${browser}
        sleep  5
        maximize browser window
        sleep  5
click_Register_Link
        click link  xpath://a[text()='REGISTER']
        #page should contain  To create your account, we'll need some basic information about you.
        title should be  Register: Mercury Tours
Input Username
    [Arguments]  ${Username}
    ${"email_txt"}    set variable  xpath://input[@id='email']
     element should be visible  ${"email_txt"}
     element should be enabled  ${"email_txt"}
     input text  ${"email_txt"}  ${Username}
Input Password1
      [Arguments]  ${Password}
      ${"email_txt1"}    set variable  xpath://input[@name='password']

     element should be visible  ${"email_txt1"}
     element should be enabled  ${"email_txt1"}
     input text  ${"email_txt1"}  ${Password}
Input Password2
     [Arguments]  ${ConfirmPassword}
   ${"email_txt2"}    set variable  xpath://input[@name='confirmPassword']
    element should be visible  ${"email_txt2"}
     element should be enabled  ${"email_txt2"}
     input text  ${"email_txt2"}  ${ConfirmPassword}
choose_value_from_dropdown
    [Arguments]  ${Country}
     select from list by value  country   ${Country}
clicksubmit
 click element    xpath://input[@name='submit']
VerifyRegister
 page should contain  Thank you for registering.
closingbrowser
    close all browsers
