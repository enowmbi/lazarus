FactoryBot.define do 
 factory :immediate_contact do 
 student
 first_name {"Juanita"}
 last_name {"Dope"}
 relation{"Mother"}
 email{"juanita_dope@example.com"}
 office_phone1{"123456789"}
 office_phone2{"123456789"}
 mobile_phone{"234 9877644"}
 office_address_line1 {"Address one"}
 office_address_line2 {"Chicago"}
 city {"Chicago"}
 state{"Ilinois"}
 country
 dob {Time.now}
 occupation {"occupation"}
 income {"123000"}
 education {"Degree"}
 school
 user
end
end
