*** Settings ***
Library       QWeb
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check product images
    QWeb.Appstate    Login
    


*** Keywords ***
Login
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://www.saucedemo.com/
    TypeText              Username    standard_user
    TypeText              Password    secret_sauce
    ClickText             Login