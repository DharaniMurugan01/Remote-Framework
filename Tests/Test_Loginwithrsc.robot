*** Settings ***
Resource    resources.robot
Library    SeleniumLibrary
*** Variables ***
${err}    
${dash-txt}

*** Test Cases ***
validate unsuccessful login
   [Tags]    Smoke Regression
   Open the Browser with url
   Fill the login form    ${invalid-un}    ${invalid-pw}
   verify the error msg is correct
   Close the browser session
validate successfull login
    [Tags]    ULT
    Open the Browser with url
    Fill the login form    ${un}    ${pw}
    verify the dashboardpage is open
    Close the browser session
*** Keywords ***

Fill the login form 
    [Arguments]    ${un}    ${pw}
    Input Text    css:input[name=username]    ${un}
    Input Password    css:input[name=password]    ${pw}
    Click Button    //button
verify the error msg is correct
    Element Text Should Be    ${err}    Invalid credentials
 verify the dashboardpage is open
     Element Text Should Be    ${dash-txt}    Dashboard

