*** Settings ***
Library       QWeb
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check product images
    Appstate    Home
    VerifyIcon        cart
    VerifyIcon        sacha
    VerifyIcon        bumble
    VerifyIcon        gerald
    ScrollTo          Todd the Hedgehog
    VerifyIcon        todd
    VerifyIcon        scar
    VerifyIcon        gavin
    ScrollTo          Find your spirit animal
    VerifyText        Find your spirit animal

Check Our Story images
    Appstate    Our Story
    VerifyIcon        ava
    VerifyIcon        steph

Add Todd to cart
    Appstate    Home
    ScrollTo    Todd the Hedgehog
    ClickIcon    todd
    VerifyIcon    todd
    VerifyText    $9.00
    ClickText     Add to cart

*** Keywords ***
Home
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://qentinelqi.github.io/shop/

Our Story
    ${Status}=            IsIcon    sacha
    IF                    ${status}    ClickText    Our Story