*** Keywords ***

Trigger POST
    [Arguments]  ${domain_name}  ${resource_path}  ${header}  ${req_body}
    ${final_stm_header} =  Convert Json to Dictionary  ${header}
    ${final_body} =  Convert Json to Dictionary  ${req_body}

    Create Session  POST_Alias  ${domain_name}  disable_warnings=1
    ${Final_Response} =  Post On Session  POST_Alias  ${resource_path}  headers=${final_stm_header}  data=${final_body}
    Log to Console  POST CALL RESPONSE:
    Log to Console  ${Final_Response.status_code}
    Log to Console  ${Final_Response.content}
    Should be True  ${Final_Response.status_code}  201
    [Return]  ${Final_Response.content}

Trigger PATCH
    [Arguments]  ${domain_name}  ${resource_path}  ${header}  ${req_body}
    ${final_stm_header} =  Convert Json to Dictionary  ${header}
    ${final_body} =  Convert Json to Dictionary  ${req_body}
    Log to Console  ${domain_name}${resource_path}
    Create Session  PATCH_Alias  ${domain_name}  disable_warnings=1
    ${Final_Response} =  Patch On Session  PATCH_Alias  ${resource_path}  headers=${final_stm_header}  data=${final_body}
    Log to Console  PATCH CALL RESPONSE:
    Log to Console  ${Final_Response.status_code}
    Log to Console  ${Final_Response.content}
    Should be True  ${Final_Response.status_code}  200
    [Return]  ${GET_Final_Response.content}

Trigger GET
    [Arguments]  ${get_domain_name}  ${get_resource_path}  ${get_header}  ${get_param}=None
    ${final_stm_header} =  Convert Json to Dictionary  ${get_header}
    ${final_param} =  Convert Json to Dictionary  ${get_param}
    Log to Console  URL:
    Log to Console  ${get_domain_name}${get_resource_path}
    Create Session  GET_Alias  ${get_domain_name}  headers=${final_stm_header}  disable_warnings=1
    ${GET_Final_Response} =  GET On Session  GET_Alias  url=${get_resource_path}  expected_status=any  params=${final_param}
    Log to Console  GET CALL RESPONSE:
    Log to Console  ${GET_Final_Response.status_code}
    Log to Console  ${GET_Final_Response.content}
    ${code} =  Convert To String  ${GET_Final_Response.status_code}
    Should be Equal  ${code}  200
    [Return]  ${GET_Final_Response.content}

Trigger GET for negative scenario
    [Arguments]  ${get_domain_name}  ${get_resource_path}  ${get_header}  ${get_param}=None
    ${final_stm_header} =  Convert Json to Dictionary  ${get_header}
    ${final_param} =  Convert Json to Dictionary  ${get_param}
    Log to Console  URL:
    Log to Console  ${get_domain_name}${get_resource_path}
    Create Session  GET_Alias  ${get_domain_name}  headers=${final_stm_header}  disable_warnings=1
    ${GET_Final_Response} =  GET On Session  GET_Alias  url=${get_resource_path}  expected_status=any  params=${final_param}
    Log to Console  GET CALL RESPONSE:
    Log to Console  ${GET_Final_Response.status_code}
    Log to Console  ${GET_Final_Response.content}
    ${code} =  Convert To String  ${GET_Final_Response.status_code}
    [Return]  ${GET_Final_Response.content}

Convert Json to Dictionary
    [Arguments]  ${json_value}
    ${json2dic}  evaluate  json.loads('''${json_value}''')    json
    [Return]  ${json2dic}