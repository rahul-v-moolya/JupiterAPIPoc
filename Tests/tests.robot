*** Settings ***
Library    RequestsLibrary
Resource    ../ApiResources/utility.robot
Resource    ../ApiResources/operation.robot
Resource    ../ApiConfig.robot

#robot -d Results -i e2e  Execute_Test

*** Test Cases ***

GET - https://api.staging.jupiter.money/pay/v1/upi/user-registration/
    [Tags]    TC01
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_all_payees_resource_path}  ${get_all_payees_headers}  ${get_all_payees_params}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s

GET - https://api.staging.jupiter.money/pay/v1/payees/all
    [Tags]    TC02
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_all_payees_resource_path}  ${get_all_payees_headers}  ${get_all_payees_params}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s

GET - https://api.staging.jupiter.money/pay/v1/transfers/applicable-rails
    [Tags]    TC03
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_applicable_rails_resource_path}  ${get_applicable_rails_headers}  ${get_applicable_rails_params}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s

GET - https://api.staging.jupiter.money/pay/v1/modes/transfers/banks
    [Tags]    TC04
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_all_banks_path}  ${get_all_banks_header}    {}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s

GET - https://api.staging.jupiter.money/pay/v1/transfers/payees/recent
    [Tags]    TC05
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_recent_payees_path}  ${get_recent_payees_header}    {}
    # ${id} =  Extract attribute from response  ${Final_Response}  $.detail
    Sleep  2s