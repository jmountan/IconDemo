*** Settings ***
Library       QWeb
Library       OperatingSystem
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check product images
    QWeb.Appstate    Login

*** Keywords ***
Login
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://qentinelqi.github.io/shop/