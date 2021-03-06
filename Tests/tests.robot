*** Settings ***
Library    RequestsLibrary
Resource    ../ApiResources/utility.robot
Resource    ../ApiResources/operation.robot
Resource    ../ApiConfig.robot

#robot -d Results -i e2e  Execute_Test

*** Test Cases ***

GET - https://api.staging.jupiter.money/pay/v1/upi/user-registration/
    [Tags]    TC01  Positive
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_user_registration_url}  ${get_user_registration_headers}  {}
    ${deviceId} =  Extract attribute from response  ${Final_Response}  $["deviceId"]
    should be equal     4cbaaefeb551329f   ${deviceId}
    ${isRegistered} =  Extract attribute from response  ${Final_Response}  $["isRegistered"]
    should be equal     [true]   ${isRegistered}
    ${sponsorBank} =  Extract attribute from response  ${Final_Response}  $["sponsorBank"]
    should be equal     urn:spsba:axis   ${sponsorBank}

GET - https://api.staging.jupiter.money/pay/v1/payees/all
    [Tags]    TC02  Positive
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_all_payees_resource_path}  ${get_all_payees_headers}  ${get_all_payees_params}
    ${payeeId} =  Extract attribute from response  ${Final_Response}  $.[0]["payeeId"]
    ${accountHolderName} =  Extract attribute from response  ${Final_Response}  $.[0]["accountHolderName"]
    ${nick_name} =  Extract attribute from response  ${Final_Response}  $.[0]["nickname"]
    ${accountNumber} =  Extract attribute from response  ${Final_Response}  $.[0]["vpa"]
    ${accountNumber} =  Extract attribute from response  ${Final_Response}  $.[0]["isActive"]
    ${payeeType} =  Extract attribute from response  ${Final_Response}  $.[0]["payeeType"]
    ${payeeType} =  Extract attribute from response  ${Final_Response}  $.[0]["activatedAt"]
    # ${ifsc} =  Extract attribute from response  ${Final_Response}  $.[0]["ifsc"]["ifsc"]
    # ${name} =  Extract attribute from response  ${Final_Response}  $.[0]["ifsc"]["name"]
    # ${institutionType} =  Extract attribute from response  ${Final_Response}  $.[0]["ifsc"]["institutionType"]
    # ${accountNumber} =  Extract attribute from response  ${Final_Response}  $.[0]["accountNumber"]
    # ${payeeBankDetails_id} =  Extract attribute from response  ${Final_Response}  $.[0]["payeeBankDetails"]["id"]
    # ${payeeBankDetails_institutionType} =  Extract attribute from response  ${Final_Response}  $.[0]["payeeBankDetails"]["institutionType"]

GET - https://api.staging.jupiter.money/pay/v1/transfers/applicable-rails
    [Tags]    TC03  Positive
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_applicable_rails_resource_path}  ${get_applicable_rails_headers}  ${get_applicable_rails_params}
    ${transferType} =  Extract attribute from response  ${Final_Response}  $.[0]["transferType"]
    ${perDayTransactionAmountLimit} =  Extract attribute from response  ${Final_Response}  $.[0]["perDayTransactionAmountLimit"]
    ${perTransactionAmountLimit} =  Extract attribute from response  ${Final_Response}  $.[0]["perTransactionAmountLimit"]
    ${isAllowed} =  Extract attribute from response  ${Final_Response}  $.[0]["isAllowed"]

GET - https://api.staging.jupiter.money/pay/v1/modes/transfers/banks
    [Tags]    TC04  Positive
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_all_banks_path}  ${get_all_banks_header}    {}

GET - https://api.staging.jupiter.money/pay/v1/transfers/payees/recent
    [Tags]    TC05  Positive
    ${Final_Response} =  Trigger GET  ${env_domain_name}  ${get_recent_payees_path}  ${get_recent_payees_header}    {}
    ${payeeId} =  Extract attribute from response  ${Final_Response}  $.[0]["payeeId"]
    ${accountHolderName} =  Extract attribute from response  ${Final_Response}  $.[0]["accountHolderName"]
    ${ifsc} =  Extract attribute from response  ${Final_Response}  $.[0]["ifsc"]["ifsc"]
    ${name} =  Extract attribute from response  ${Final_Response}  $.[0]["ifsc"]["name"]
    ${institutionType} =  Extract attribute from response  ${Final_Response}  $.[0]["ifsc"]["institutionType"]
    ${accountNumber} =  Extract attribute from response  ${Final_Response}  $.[0]["accountNumber"]
    ${payeeBankDetails_id} =  Extract attribute from response  ${Final_Response}  $.[0]["payeeBankDetails"]["id"]
    ${payeeType} =  Extract attribute from response  ${Final_Response}  $.[0]["payeeType"]
    ${payeeBankDetails_institutionType} =  Extract attribute from response  ${Final_Response}  $.[0]["payeeBankDetails"]["institutionType"]

#Negative scenarios
GET - https://api.staging.jupiter.money/pay/v1/upi/user-registration/
    [Tags]    TC06  Negative
    ${Final_Response} =  Trigger GET for negative scenario  ${env_domain_name}  ${neg_get_user_registration_url}  ${neg_get_user_registration_headers}  {}
    ${error_message} =  Extract attribute from response  ${Final_Response}  $.["message"]
    should be equal     No user found from applicable headers.   ${error_message}
    ${errorCode} =  Extract attribute from response  ${Final_Response}  $.["errorCode"]
    should be equal     authorization_error   ${errorCode}
    
GET - https://api.staging.jupiter.money/pay/v1/payees/all
    [Tags]    TC07  Negative
    ${Final_Response} =  Trigger GET for negative scenario  ${env_domain_name}  ${neg_get_all_payees_resource_path}  ${neg_get_all_payees_headers}  ${neg_get_all_payees_params}
    ${error_message} =  Extract attribute from response  ${Final_Response}  $.["message"]
    should be equal     No user found from applicable headers.   ${error_message}
    ${errorCode} =  Extract attribute from response  ${Final_Response}  $.["errorCode"]
    should be equal     authorization_error   ${errorCode}
    

GET - https://api.staging.jupiter.money/pay/v1/transfers/applicable-rails
    [Tags]    TC08  Negative
    ${Final_Response} =  Trigger GET for negative scenario  ${env_domain_name}  ${neg_get_applicable_rails_resource_path}  ${neg_get_applicable_rails_headers}  ${neg_get_applicable_rails_params}
    ${error_message} =  Extract attribute from response  ${Final_Response}  $.["message"]
    should be equal     No user found from applicable headers.   ${error_message}
    ${errorCode} =  Extract attribute from response  ${Final_Response}  $.["errorCode"]
    should be equal     authorization_error   ${errorCode}
    

GET - https://api.staging.jupiter.money/pay/v1/modes/transfers/banks
    [Tags]    TC09  Negative
    ${Final_Response} =  Trigger GET for negative scenario  ${env_domain_name}  ${neg_get_all_banks_path}  ${neg_get_all_banks_header}    {}
    ${error_message} =  Extract attribute from response  ${Final_Response}  $.["message"]
    should be equal     No user found from applicable headers.   ${error_message}
    ${errorCode} =  Extract attribute from response  ${Final_Response}  $.["errorCode"]
    should be equal     authorization_error   ${errorCode}

GET - https://api.staging.jupiter.money/pay/v1/transfers/payees/recent
    [Tags]    TC10  Negative
    ${Final_Response} =  Trigger GET for negative scenario  ${env_domain_name}  ${neg_get_recent_payees_path}  ${neg_get_recent_payees_header}    {}
    ${error_message} =  Extract attribute from response  ${Final_Response}  $.["message"]
    should be equal     No user found from applicable headers.   ${error_message}
    ${errorCode} =  Extract attribute from response  ${Final_Response}  $.["errorCode"]
    should not be equal     authorization_error   ${errorCode}