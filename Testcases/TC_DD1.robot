*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/login_resources.robot
Suite Setup  openmyBrowser
Suite Teardown  closingbrowser
Test Template   invalidlogin

*** Test Cases ***              username                password
Right user empty password       admin@yourstore.com     ${EMPTY}
Right user wrong password       admin@yourstore.com     xz
wrong user right password          admin                admin
wrong user empty password          admin                 ${EMPTY}
wrong user wrong password          admin                 admin








*** Keywords ***
invalidlogin
        [Arguments]  ${username}    ${password}
        Input username  ${username}
        Input pwd       ${password}
        clicklogin
        Errormessage

