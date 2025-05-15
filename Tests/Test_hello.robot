*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Login with valid credentials
    Open Browser    url=https://the-internet.herokuapp.com/login    browser=headlesschrome
    Input Text    username   tomsmith
    Input Text    password    SuperSecretPassword!
    Click Button     class:radiu
    Element Should Contain    id=flash    You logged into a secure area!
    Click Link   xpath=//a[@class='button secondary radius']
    Close Browser
