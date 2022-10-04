*** Settings ***
Library       QWeb
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check product images
    Appstate    Home
    VerifyIcon        cart
    VerifyIcon        sacha.jpeg
    VerifyIcon        bumble
    VerifyIcon        gerald

*** Keywords ***
Home
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://qentinelqi.github.io/shop/