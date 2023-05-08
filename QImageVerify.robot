*** Settings ***
Library       QWeb
Library       OperatingSystem
Library       QImage
Suite Setup    Open Browser     about:blank      chrome
Suite Teardown    Close Browser

*** Variables ***
${BASE_IMAGE_PATH}          ${EXECDIR}${/}Images

*** Test Cases ***
Check product images
    Appstate    Home

    ${element}=    CaptureIcon    //img[@src\="/shop/images/products/elephant/cream.jpg"]
    ${md5}=        Get Image md5    ${element}

    CompareImageToMD5               ../QImage/cream.jpg    ${md5}
    

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


*** Keywords ***
Home
    [Documentation]       Logs into SauceDemo.com
    GoTo                  https://qentinelqi.github.io/shop/

Our Story
    ${Status}=            IsIcon    sacha
    IF                    ${status}    ClickText    Our Story