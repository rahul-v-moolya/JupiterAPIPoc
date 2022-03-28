*** Settings ***
Library    JSONLibrary
Library    String
Library    Collections

*** Keywords ***

Extract attribute from response
    [Arguments]  ${json_body}  ${json_path}
    ${string_json} =  Convert String To JSON  ${json_body}
    ${attribute_value} =  Get Value From Json  ${string_json}  ${json_path}
    ${str_attrib} =  Convert JSON To String  ${attribute_value}
    ${str} =  Remove Unexpected String  ${str_attrib}  ["
    ${str} =  Remove Unexpected String  ${str}  "]
    Set Test Variable  ${user_id}  ${str}
    Log to Console  ${user_id}
    [Return]  ${user_id}

Remove Unexpected String
    [Arguments]  ${content}  ${remove}
    ${val} =  Remove String  ${content}  ${remove}
    [Return]  ${val}

Replace expected String
    [Arguments]  ${content}  ${search_str}  ${replace_str}
    ${value} =  Replace String  ${content}  ${search_str}  ${replace_str}
    [Return]  ${value}