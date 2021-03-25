*** Settings ***
Library  SeleniumLibrary
Test Teardown  run keyword if test failed  Log  Screenshot
Resource  ../Resources/Demo_Login.robot
Library  DataDriver  ../TestData/Demo.xls  sheet_name=Sheet2
Suite Setup  openmyBrowser
Suite Teardown  closingbrowser
Test Template   Login to the application

*** Test Cases ***
Logintc




*** Keywords ***
Login to the application
  [Arguments]  ${Username}    ${Password}  ${Passengers}  ${Departing From}  ${On}  ${OnDay}  ${Arriving}  ${Returnmonth}  ${Returnday}  ${Airline}
        Input username  ${Username}
        Input Password1  ${Password}
        clicksubmit
        VerifyLogin
        ClickFlights
        Typeradio
        Passengersdropdown  ${Passengers}
        DepartingFromdropdown  ${Departing From}
        Ondropdown  ${On}
        ondropdowndate  ${OnDay}
        ArrivingIndropdown  ${Arriving}
        Returningmonthdropdown  ${Returnmonth}
        Returningdaydropdown  ${Returnday}
        Serviceclassradio
        Airlinedropdown  ${Airline}
        clickContinue

