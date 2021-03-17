*** Settings ***
Library  SeleniumLibrary



*** Variables ***
${loginurl}  http://demo.guru99.com/test/newtours/
${browser}  chrome

*** Keywords ***
openmyBrowser
        open browser        ${loginurl}     ${browser}
        sleep  5
        maximize browser window
        sleep  5
Input Username
    [Arguments]  ${Username}
    ${"email_txt"}    set variable  xpath://input[@name='userName']
     element should be visible  ${"email_txt"}
     element should be enabled  ${"email_txt"}
     input text  ${"email_txt"}  ${Username}
Input Password1
      [Arguments]  ${Password}
      ${"email_txt1"}    set variable  xpath://input[@name='password']

     element should be visible  ${"email_txt1"}
     element should be enabled  ${"email_txt1"}
     input text  ${"email_txt1"}  ${Password}
clicksubmit
        click element    xpath://input[@name='submit']
VerifyLogin
    page should contain  Login Successfully
ClickFlights
    click link  xpath://a[text()='Flights']
Typeradio
  page should contain radio button  //input[@type='radio' and @value='roundtrip']
  #select radio button  xpath://input[@type='radio' and @value='oneway']  1
  click element  xpath://input[@type='radio' and @value='oneway']
Passengersdropdown
   [Arguments]  ${Passengers}
     select from list by value  passCount   ${Passengers}
DepartingFromdropdown
  [Arguments]  ${Departing From}
     select from list by value  fromPort   ${Departing From}
Ondropdown
     [Arguments]  ${On}
     select from list by label  fromMonth   ${On}
ondropdowndate
     [Arguments]  ${OnDay}
     select from list by value  fromDay   ${OnDay}
ArrivingIndropdown
     [Arguments]  ${Arriving}
     select from list by value  toPort   ${Arriving}
Returningmonthdropdown
     [Arguments]  ${Returnmonth}
     select from list by label  toMonth   ${Returnmonth}
Returningdaydropdown
     [Arguments]  ${Returnday}
     select from list by value  toDay   ${Returnday}
Serviceclassradio
   page should contain radio button  //input[@type='radio' and @value='Coach']
   click element  xpath://input[@value='Business']
Airlinedropdown
    [Arguments]  ${Airline}
     select from list by label  airline   ${Airline}
clickContinue
    click element    xpath://input[@name='findFlights']
closingbrowser
        close all browsers