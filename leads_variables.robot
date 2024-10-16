*** Variables ***
${dirver_path}                  ${EXECDIR}\\chromedriver.exe
${URL}                          https://www.zoho.com/en-in/crm/
${browser}                      chrome
${username}                     consumer authtenant
${email_id}                     consumerauthtenant@gmail.com
${password}                     pallet@test
${LEADS_MODULE_LOCATOR}         //*[@id="Visible_Leads"]
${LEADS_MODULE}                 Leads
${firstname}                    pallet
${company_name}                 pallettest
${last_name}                    test
${email}                        pallettest@sharklasers.com
${phone}                        ${EMPTY}
${designation}                  ${EMPTY}
${leadsource}                   Advertisement

${FIRSTNAME_FIELD_LOCATOR}      //*[@id="Crm_Leads_FIRSTNAME_LInput"]
${DESIGNATION_FIELD_LOCATOR}    //*[@id="Crm_Leads_DESIGNATION_LInput"]
${PHONE_FIELD_LOCATOR}          //*[@id="Crm_Leads_PHONE_LInput"]
${COMPANY_FIELD_LOCATOR}        //input[@type='text' and @maxlength='200']
${LASTNAME_FIELD_LOCATOR}       //*[@id="Crm_Leads_LASTNAME_LInput"]
${EMAIL_FIELD_LOCATOR}          //*[@id="Crm_Leads_EMAIL_LInput"]
${LEAD_SOURCE_DROPDOWN}         //*[@id="Crm_Leads_LEADSOURCE"]
