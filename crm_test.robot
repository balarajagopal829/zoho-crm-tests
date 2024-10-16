*** Settings ***
Documentation       Hello

Resource            crm_resource.robot
Resource            common_resource.robot

Suite Setup         Open Zoho CRM And Login


*** Test Cases ***
Verify Lead Creation with Only Mandatory Fields
    [Documentation]    This test verifies that a new lead can be successfully created in Zoho CRM when only the mandatory fields (last name and company) are filled.
    Navigate To Module    ${leads_module_locator}    ${leads_module}
    Click Create New Lead
    Input Lead Information    lastname=${last_name}    company=${company_name}
    Save Lead
    Verify Lead Creation Is Successful
    Verify Lead In Leads List
    Delete Lead

Verify Lead Creation Fails without Mandatory Fields
    [Documentation]    This test ensures that attempting to create a lead without filling the mandatory fields results in a failure.
    Navigate To Module    ${leads_module_locator}    ${leads_module}
    Click Create New Lead
    Input Lead Information    lastname=${last_name}
    Save Lead
    Verify Lead Creation Is Failed For Not Entering Mandatory Field
    Navigate To Module    ${leads_module_locator}    ${leads_module}
    Delete Lead

Verify Email Field Can Be Updated Using Edit Option After Lead Creation
    [Documentation]    This test confirms that the email field of an existing lead can be successfully updated using the edit option in Zoho CRM.
    Navigate To Module    ${leads_module_locator}    ${leads_module}
    Click Create New Lead
    Input Lead Information    lastname=${last_name}    company=${company_name}
    Save Lead
    Verify Lead Creation Is Successful
    Verify Lead In Leads List
    Verify Lead Information Is Updated Using Edit Option

Verify Lead Deletion Is Successful
    [Documentation]    This test ensures that a lead can be successfully deleted and that the lead no longer appears in the Leads module after deletion.
    Delete Lead
