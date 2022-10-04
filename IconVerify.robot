*** Settings ***
Library       QWeb
Library       QVision
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check product images
    QWeb.Appstate    Login
    Set Library Search Order    QWeb    QVision
    


*** Keywords ***
Login
    [Documentation]       Logs into SauceDemo.com
    Set Library Search Order    QWeb    QVision
    GoTo                  https://www.saucedemo.com/
    TypeText              Username    standard_user
    TypeText              Password    secret_sauce