*** Settings ***
Library       QWeb
Library       OperatingSystem
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check product images
    QWeb.Appstate    Login
    VerifyIcon          swaglabs
    VerifyIcon          peek
    VerifyIcon          backpack
    VerifyIcon          bikelight
    VerifyIcon          boltshirt
    VerifyIcon          onsie
    VerifyIcon          pullover
    VerifyIcon          redshirt
    ScrollTo            All Rights Reserved
    VerifyIcon          footer

*** Keywords ***
Login
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://www.saucedemo.com/
    TypeText              Username    standard_user
    TypeText              Password    secret_sauce
    ClickText             Login