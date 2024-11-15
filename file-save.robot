*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${URL}            https://www.australia.com/en
${FOLDER_PATH}   ${CURDIR}/Australia/Queensland.txt
${SEARCH_TEXT_BOX}    //input[@id='dt-search-input-field-desktop']
${POPUP_BUTTON}    //button[contains(text(),'Ok, I agree')]
${SEARCH_BUTTON}    //body/main[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/nav[1]/div[2]/a[2]/img[1]
${QUEENSLAND_TOPIC}    //body/div[2]/main[1]/div[1]/div[4]/div[3]/div[2]/div[1]/div[1]/div[1]/div[3]/div[2]/a[2]/div[1]/div[2]/div[1]/div[1]/div[1]/p[1]
${DROP_DOWN}    //body/main[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/ul[1]/li[3]/a[1]
${DESCRIPTION_PATH}    //p[contains(text(),'Home to more than 1,000 ecosystem types and five W')]

*** Test Cases ***
Extract Description and Save to File
    [Documentation]   Extract the first description from the website and save it to a file.
    Open Browser      ${URL}    Chrome
    Sleep             3s
    Click Element   xpath=${POPUP_BUTTON} 
    Log To Console     Page Loaded!

    Click Element   xpath=${SEARCH_BUTTON}
    Sleep             3s
    Click Element   xpath=${SEARCH_TEXT_BOX} 
    Input Text     xpath=${SEARCH_TEXT_BOX}     Queensland
    Sleep             1s
    Click Element   xpath=${DROP_DOWN}
    Log To Console     Search Done!

    Sleep             3s
    Execute JavaScript    window.scrollBy(0, 600)
    Sleep             1s
    Click Element   xpath=${QUEENSLAND_TOPIC}
    Sleep             3s
    Execute JavaScript    window.scrollBy(0, 600)
    Sleep             2s
    ${description}=   Get Text   xpath=${DESCRIPTION_PATH} 
    Log To Console     Got the topic!


    Create File        ${FOLDER_PATH}  ${description}
    Log To Console     File created at: ${FOLDER_PATH}


