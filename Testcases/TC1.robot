*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}   chrome
${url}   https://demo.nopcommerce.com/

*** Test Cases ***
Logintest

        open browser        ${url}     ${browser}
        click link  xpath://a[@class='ico-login']
        Loginapplication
        close browser



*** Keywords ***
Loginapplication
        input text  id:Email        kalaidhinu94@gmail.com
        input text  id:Password     test@123
        click element  xpath://button[@class='button-1 login-button']
