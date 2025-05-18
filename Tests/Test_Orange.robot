*** Settings ***
Documentation    To validate the login form with valid credentials
Library     SeleniumLibrary
Library    Collections

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${username}     Admin
${password}     admin123
${verify_word_login}   Forgot your password?
${dashboard}    Dashboard

*** Test Cases ***

validate the elements on the login page
    open the browser with url
    verify element on login page
    close browser session

validate successfull login
    open the browser with url
    fill the login form
    verify dashboard page open
    # verify the items in the dashboard page
    close browser session

validate the sidebar items are visible
    open the browser with url
    fill the login form
    verify the items in the dashboard page
    close browser session

*** Keywords ***
open the browser with url
    Open Browser    ${url}    browser=chrome
    Maximize Browser Window
    Set Selenium Timeout    10s


verify element on login page
    Wait Until Element Is Visible   xpath=//p[@class='oxd-text oxd-text--p orangehrm-login-forgot-header']    10s
    Element Should Contain   xpath=//p[@class='oxd-text oxd-text--p orangehrm-login-forgot-header']    ${verify_word_login}   

fill the login form
    Wait Until Element Is Visible    xpath=//input[@name='username']    10s
    Input Text    xpath=//input[@name='username']    ${username}
    Input Text    xpath=//input[@name='password']     ${password}
    Click Button    //button

verify dashboard page open
     Wait Until Element Is Visible    //h6    10s
     Element Should Contain    //h6    ${dashboard}
    
verify the items in the dashboard page
    @{expectedlist}=    Create List    Admin    PIM    Leave    Time    Recruitment    My Info    Performance    Dashboard    Directory    Maintenance    Claim    Buzz
    Wait Until Element Is Visible    xpath=//span[@class='oxd-text oxd-text--span oxd-main-menu-item--name']    10s
    ${ele}=    Get WebElements    xpath=//span[@class='oxd-text oxd-text--span oxd-main-menu-item--name']
    @{act}=    Create List
    FOR    ${el}    IN    @{ele}
        ${text}=    Get Text    ${el}
        Append To List    ${act}    ${text}
    END
    Lists Should Be Equal    ${act}    ${expectedlist}
    
close browser session
    Close Browser





