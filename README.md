# zoho-crm-tests
This repository contains test automation scripts for Zoho CRM's Leads Module, developed using **Robot Framework** and **SeleniumLibrary**. The automation suite covers key functionalities such as lead creation, validation of required fields, lead updates, and lead deletion.

# Attachments Included
The following files are included in the repository to assist with test execution:

**chromedriver.exe**: A Chrome WebDriver required for running the tests in Chrome. Make sure to update this if your Chrome version differs.

**Test Data Files**: Files such as crm_resource.robot and common_resource.robot containing reusable data and resource keywords for CRM automation.

**Test Suite Files**: The primary test case file crm_test.robot, containing all the lead management test scenarios.

**Results**: The result folder contains the log report of this test execution.

# Installation
  **Clone the repository**
    git clone https://github.com/balarajagopal829/zoho-crm-tests.git
    
  **Install dependencies**
     Install Python 3.8+.
     Install Robot Framework 7.0:
        pip install robotframework
        pip install robotframework-seleniumlibrary
     The repository includes chromedriver.exe. Make sure to replace it with the correct version for your Chrome browser if necessary.
    
  **Set up credentials**
     Update the crm_resource.robot file with valid Zoho CRM credentials, such as email_id and password.
    
# Running the Tests
You can run the entire test suite or individual test cases using the Robot Framework command.

  **To run all tests-**
    robot crm_test.robot
    
  **To run a specific test case-**
    robot -t "Verify Lead Creation with Only Mandatory Fields" crm_test.robot
    
# Test Approach and Coverage
  **Reasoning Behind Test Approach-**
    **Mandatory Field Validation**: It's crucial to verify that only valid lead creation attempts succeed. The system should reject incomplete or incorrect data.
    **Data Update Functionality**: This ensures that the system allows for modification of lead details, specifically the email field, which is a common requirement.
    **Lead Deletion**: Ensuring that a lead can be deleted is important for maintaining accurate data in the CRM system.
    
  **Test Coverage-**
      **Positive Tests**: Lead creation with all required fields, email update, lead deletion.
      **Negative Tests**: Lead creation failure when required fields are missing.

