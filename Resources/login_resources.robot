*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${loginurl}
${browser}

*** Keywords ***
openmyBrowser
        open browser        ${loginurl}     ${browser}
        maximize browser window

closingbrowser
        close all browsers
open login page
        go to  ${loginurl}
Input username
        [Arguments]  ${username}
        input text      id:Email        ${username}
Input pwd
        [Arguments]  ${password}

        input text      id:Password     ${password}
clicklogin
        click element    xpath://button[@class='button-1 login-button']
clicklogout
        click link  Logout
Errormessage
        page should contain  Login was unsuccessful.
Dashboard should be visible
        page should contain  Dashboard

