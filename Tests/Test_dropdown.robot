*** Settings ***
Documentation    To validate the dropdown options
Library    SeleniumLibrary

*** Test Cases ***
Select option in dropdowns
    Open The Browser With Url
    Select The Dropdown Option API By Value
    Select The Dropdown Option Microsoft Excel By Index
    Select The Dropdown Option CSS By Label

*** Keywords ***
Open The Browser With Url
    Create Webdriver    Chrome
    Go To    https://demo.automationtesting.in/Register.html
    Maximize Browser Window
    Set Selenium Implicit Wait    2

Select The Dropdown Option API By Value
    Select From List By Value    xpath=//select[@id='Skills']    APIs

Select The Dropdown Option Microsoft Excel By Index
    Select From List By Index    xpath=//select[@id='Skills']    5

Select The Dropdown Option CSS By Label
    Select From List By Label    xpath=//select[@id='Skills']    CSS
