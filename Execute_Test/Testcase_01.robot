*** Settings ***
Library    RequestsLibrary
Resource    ../api_resources/utility.robot
Resource    ../api_resources/operation.robot
Resource    ../api_configs.robot

#robot -d Results -i e2e  Execute_Test

*** Test Cases ***

Trigger GET call for User Registration
    [Tags]    TC01
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_all_payees_resource_path}  ${get_all_payees_headers}  ${get_all_payees_params}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s

Trigger GET call for All Payees
    [Tags]    TC02
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_all_payees_resource_path}  ${get_all_payees_headers}  ${get_all_payees_params}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s

Trigger GET call for Applicable Rails
    [Tags]    TC03
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_applicable_rails_resource_path}  ${get_applicable_rails_headers}  ${get_applicable_rails_params}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s

Trigger GET call for All Banks
    [Tags]    TC04
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_all_banks_path}  ${get_all_banks_header}    {}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s

Trigger GET call for Recent Payees
    [Tags]    TC05
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_recent_payees_path}  ${get_recent_payees_header}    {}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s