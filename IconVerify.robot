*** Settings ***
Library       QWeb
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Variables ***
${BASE_IMAGE_PATH}          ${CURDIR}${/}Images

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
    CaptureIcon    xpath\=//img[@src\="/shop/images/products/hog/clay.jpg"]    folder=Images    filename=ToddCap.png
    ClickIcon    todd
    VerifyIcon    toddCap
    VerifyText    $9.00
    ClickText     Add to cart

*** Keywords ***
Home
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://qentinelqi.github.io/shop/

Our Story
    ${Status}=            IsIcon    sacha
    IF                    ${status}    ClickText    Our Story