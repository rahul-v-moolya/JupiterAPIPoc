*** Variables ***

#Common
# ${header} =  {"Content-Type":"application/json"}
${env_domain_name} =  https://api.staging.jupiter.money/pay/v1

#Get-UserRegistration
${get_user_registration_url} =  /upi/user-registration/4cbaaefeb551329f
${get_user_registration_headers} =  {"X-Jupiter-Sponsor-Bank":"urn:spsba:axis", "X-User-Id":"45a23b7f-4189-47d8-8592-0044af3d194b","X-Tenant":"urn:tenant:jupiter"}

#Get-AllPayees
${get_all_payees_resource_path} =  /payees/all
${get_all_payees_params} =  {"payeeTypes":"money.jupiter.payee.types.ifsc-linked"}
${get_all_payees_headers} =  {"X-User-Id":"45a23b7f-4189-47d8-8592-0044af3d194b","X-Tenant":"urn:tenant:jupiter"}

#Get-ApplicableRails
${get_applicable_rails_resource_path} =  /transfers/applicable-rails
${get_applicable_rails_params} =  {"bankId":"4383958f-77ed-4153-9cb0-90144ceeaf5f","amount":"200002"}
${get_applicable_rails_headers} =  {"X-User-Id":"45a23b7f-4189-47d8-8592-0044af3d194b","X-Tenant":"urn:tenant:jupiter"}

#Get-AllBanks
${get_all_banks_path} =  /modes/transfers/banks
${get_all_banks_header} =  {"X-User-Id":"45a23b7f-4189-47d8-8592-0044af3d194b","X-Tenant":"urn:tenant:jupiter"}

#Get-RecentPayees
${get_recent_payees_path} =  /transfers/payees/recent
${get_recent_payees_header} =  {"X-User-Id":"45a23b7f-4189-47d8-8592-0044af3d194b","X-Tenant":"urn:tenant:jupiter"}