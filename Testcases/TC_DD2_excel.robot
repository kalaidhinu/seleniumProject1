*** Settings ***
Library  SeleniumLibrary
Test Teardown  run keyword if test failed  Log  Screenshot
Resource  ../Resources/login_resources.robot
Library  DataDriver  ../TestData/login2.xls  sheet_name=login
Suite Setup  openmyBrowser
Suite Teardown  closingbrowser
Test Template   invalidlogin

*** Test Cases ***
LogintestwithExcel using   ${username}    ${password}




*** Keywords ***
invalidlogin
        [Arguments]  ${username}    ${password}
        Input username  ${username}
        Input pwd       ${password}
        clicklogin
        Dashboard should be visible


