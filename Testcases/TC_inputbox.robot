*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://demo.nopcommerce.com/


*** Test Cases ***
TestingINPUTBOX
  OPEN BROWSER    ${url}  ${browser}
  MAXIMIZE BROWSER WINDOW
  title should be  nopCommerce demo store
  click link  xpath://a[@class='ico-login']
  ${"email_txt"}    set variable  id:Email
  element should be visible  ${"email_txt"}
  ${"Enabled"}  run keyword and return status  element should be enabled  ${"email_txt"}
  run keyword if  ${"Enabled"}=='PASS'  run keywords
  ...  input text  id:Email       johndavid@gmail.com
  ...  AND  sleep  2
  ...  AND  clear element text  id:Email
  ...  AND  sleep  2



  *** Keywords ***






