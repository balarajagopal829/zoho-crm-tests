*** Settings ***
Library     SeleniumLibrary
Library     XML
Resource    leads_variables.robot


*** Keywords ***
Navigate To Module
    [Documentation]    This keyword navigates to the specified module in Zoho CRM and handles any leave-page confirmations.
    [Arguments]    ${module_locator}    ${module}
    ${leave_page_button}    Run Keyword And Return Status
    ...    Wait Until Element Is Not Visible
    ...    //*[@class="lyte-button lyteFailure"]
    ...    10s
    IF    '${leave_page_button}' == 'False'
        Click Element    //*[@class="lyte-button lyteFailure"]
    END
    Click Element    ${module_locator}
    Wait Until Element Is Visible    //*[@aria-label="Create Lead"]    10s

Click Create New Lead
    [Documentation]    Clicks the "Create Lead" button and ensures the "Create Lead" form is loaded.
    Click Element    //*[@aria-label="Create Lead"]
    Wait Until Element Is Visible    //*[@id="heading_title"]    10s
    Element Should Contain    //*[@id="heading_title"]    Create Lead

Input Lead Information
    [Documentation]    Fills in the lead information on the Create Lead form, including optional and mandatory fields.
    [Arguments]
    ...    ${firstname}=${None}
    ...    ${lastname}=${None}
    ...    ${company}=${None}
    ...    ${email}=${None}
    ...    ${phone}=${None}
    ...    ${designation}=${None}
    ...    ${leadsource}=${None}

    IF    '${firstname}' != '${None}'
        Wait Until Element Is Visible    ${FIRSTNAME_FIELD_LOCATOR}
    END
    IF    '${firstname}' != '${None}'
        Input Text    ${FIRSTNAME_FIELD_LOCATOR}    ${firstname}
    END

    IF    '${company}' != '${None}'
        Wait Until Element Is Visible    ${COMPANY_FIELD_LOCATOR}
    END
    IF    '${company}' != '${None}'
        Input Text    ${COMPANY_FIELD_LOCATOR}    ${company}
    END

    IF    '${lastname}' != '${None}'
        Wait Until Element Is Visible    ${LASTNAME_FIELD_LOCATOR}
    END
    IF    '${lastname}' != '${None}'
        Input Text    ${LASTNAME_FIELD_LOCATOR}    ${lastname}
    END

    IF    '${email}' != '${None}'
        Wait Until Element Is Visible    ${EMAIL_FIELD_LOCATOR}
    END
    IF    '${email}' != '${None}'
        Input Text    ${EMAIL_FIELD_LOCATOR}    ${email}
    END

    IF    '${phone}' != '${None}'
        Wait Until Element Is Visible    ${PHONE_FIELD_LOCATOR}
    END
    IF    '${phone}' != '${None}'
        Input Text    ${PHONE_FIELD_LOCATOR}    ${phone}
    END

    IF    '${designation}' != '${None}'
        Wait Until Element Is Visible    ${DESIGNATION_FIELD_LOCATOR}
    END
    IF    '${designation}' != '${None}'
        Input Text    ${DESIGNATION_FIELD_LOCATOR}    ${designation}
    END

    IF    '${leadsource}' != '${None}'
        Wait Until Element Is Visible    ${FIRSTNAME_FIELD_LOCATOR}
    END
    IF    '${leadsource}' != '${None}'
        Select From List By Value    ${LEAD_SOURCE_DROPDOWN}    ${leadsource}
    END

Save Lead
    [Documentation]    Saves the lead by clicking the Save button on the Create Lead form.
    Click Element    //*[@id="crm_create_savebutn"]

Verify Lead Creation Is Successful
    [Documentation]    Verifies that the lead creation was successful by checking the presence of the created lead.
    Wait Until Element Is Visible    //*[@class="busniess_card_Hover"]    10s
    Element Should Contain    //*[@class="busniess_card_Hover"]    ${last_name} - ${company_name}

Verify Lead In Leads List
    [Documentation]    Ensures the newly created lead is visible in the Leads module list.
    Navigate To Module    ${leads_module_locator}    ${leads_module}
    Element Should Be Visible
    ...    //*[@yield-name="contentYield"]//*[@role="row"][1]/lyte-exptable-td//*[@data-zcqa='${last_name}']
    Element Should Be Visible
    ...    //*[@yield-name="contentYield"]//*[@role="row"][1]/lyte-exptable-td//*[@lt-prop-value='${company_name}']

Delete Lead
    [Documentation]    Deletes the specified lead from the Leads module.
    Click Element    //*[@role="row"][1]/lyte-exptable-td/lyte-yield/lyte-checkbox
    Wait Until Element Is Visible    //*[@id="moreAct"]    10s
    Click Element    //*[@id="moreAct"]
    Wait Until Element Is Visible    //*[@id="actionParent"]    10s
    Click Element    //*[@id="actionParent"]//*[contains(text(), 'Delete')]
    Wait Until Element Is Visible    //*[@class="record_delete_button"]    10s
    Click Element    //*[@class="record_delete_button"]
    Page Should Contain Element
    ...    //*[@yield-name="contentYield"]//*[@role="row"][1]/lyte-exptable-td//*[@data-zcqa='${last_name}']
    Page Should Contain Element
    ...    //*[@yield-name="contentYield"]//*[@role="row"][1]/lyte-exptable-td//*[@lt-prop-value='${company_name}']

Verify Lead Information Is Updated Using Edit Option
    [Documentation]    Verifies that the lead information can be updated using the edit option.
    Click Element    //*[@role="row"][1]/lyte-exptable-td[1]
    Wait Until Element Is Visible    //*[@id="quickActionsOptionsList"]//*[@data-value="Edit"]    10s
    Click Element    //*[@id="quickActionsOptionsList"]//*[@data-value='Edit']
    Input Lead Information    email=${email}
    Save Lead
    Verify Lead Creation Is Successful
    Navigate To Module    ${leads_module_locator}    ${leads_module}
    Element Should Be Visible
    ...    //*[@yield-name="contentYield"]//*[@role="row"][1]/lyte-exptable-td//*[@lt-prop-value='${email}']

Verify Lead Creation Is Failed For Not Entering Mandatory Field
    [Documentation]    Ensures that lead creation fails when mandatory fields are missing.
    Wait Until Element Contains    //*[@id="errorMsg_Crm_Leads_COMPANY"]    Company cannot be empty.
    Input Lead Information    company=${company_name}
    Save Lead
    Verify Lead Creation Is Successful
