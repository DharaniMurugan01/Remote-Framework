*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Login with valid credentials

    Open Browser    url=https://www.google.com/    browser=headlesschrome
    Maximize Browser Window
    Input Text    class:gLFyf   Selenium
    Press Keys     class:gLFyf    ENTER
    Sleep    2s
    Element Should Contain    xpath=//div[@class='uODXEe wfg6Pb OSrXXb']    Selenium
    Close Browser
Login with valid1 credentials
    Open Browser    url=https://www.google.com/    browser=headlesschrome
    Input Text    class:gLFyf   Robotframework
    Press Keys     class:gLFyf    ENTER
    Sleep    2s
    Element Should Contain    xpath=//div[@class='uODXEe wfg6Pb OSrXXb']    Robotframework
    Close Browser


