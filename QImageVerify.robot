*** Settings ***
Library       QWeb
Library       OperatingSystem
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Variables ***
${BASE_IMAGE_PATH}          ${EXECDIR}${/}Images

*** Test Cases ***
Check product images
    Appstate    Home
    # VerifyIcon        cart
    # VerifyIcon        sacha
    # VerifyIcon        bumble
    # VerifyIcon        gerald
    ScrollTo          Todd the Hedgehog
    # VerifyIcon        todd
    # VerifyIcon        scar
    # VerifyIcon        gavin
    ScrollTo          Find your spirit animal
    VerifyText        Find your spirit animal

Check Our Story images
    Appstate    Our Story
    # VerifyIcon        ava
    # VerifyIcon        steph

Add Todd to cart
    Appstate    Home
    ScrollTo    Todd the Hedgehog
    # CaptureIcon    xpath\=//img[@src\="/shop/images/products/hog/clay.jpg"]    folder=${EXECDIR}/IconDemo/Images    filename=toddcap.png

    Log            \n\n\nFiles In Images Folder:\n                        level=WARN
    ${list}=       List Directory                ${EXECDIR}/IconDemo/Images
    FOR            ${item}                       IN                        @{list}
        Log        ${item}                       level=WARN
    END
    Log            \n\n\n                        level=WARN

    ClickIcon    todd
    VerifyIcon    todd
    VerifyText    $9.00
    ClickText     Add to cart
    # Home
    # ScrollTo      Todd the Hedgehog
    # VerifyIcon    toddcap

*** Keywords ***
Home
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://qentinelqi.github.io/shop/

Our Story
    ${Status}=            IsIcon    sacha
    IF                    ${status}    ClickText    Our Story