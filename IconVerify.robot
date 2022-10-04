*** Settings ***
Library       QWeb
Library       OperatingSystem
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Variables ***
${BASE_IMAGE_PATH}          ${CURDIR}${/}Images

*** Test Cases ***
Check product images
    QWeb.Appstate    Login
    VerifyIcon          swaglabs
    VerifyIcon          peek

    List Files In Directory    ${CURDIR}
    List Files In Directory    ${CURDIR}/Images

    VerifyIcon          backpack
    ScrollTo            All Rights Reserved

*** Keywords ***
Login
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://www.saucedemo.com/
    TypeText              Username    standard_user
    TypeText              Password    secret_sauce
    ClickText             Login