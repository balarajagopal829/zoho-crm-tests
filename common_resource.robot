*** Settings ***
Library     SeleniumLibrary
Resource    leads_variables.robot


*** Keywords ***
Open Zoho CRM And Login
    [Documentation]    This keyword automates the process of logging into Zoho CRM.
    Open Browser    ${URL}    ${browser}    executable_path=${dirver_path}
    Maximize Browser Window
    Wait Until Element Is Visible    //*[contains(@class, "zgh-login") and text()="Sign In"]    10s
    Click Element    //*[contains(@class, "zgh-login") and text()="Sign In"]
    Wait Until Element Is Visible    //*[@id="login_id"]    10s
    Input Text    //*[@id="login_id"]    ${email_id}
    Click Button    //*[@id="nextbtn"]
    Wait Until Element Is Visible    //*[@id="password"]    10s
    Input Password    //*[@id="password"]    ${password}
    Click Button    //*[@id="nextbtn"]
    Wait Until Element Contains    //*[@id="show-uName"]    Welcome    30
