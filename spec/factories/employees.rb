FactoryBot.define do 
  factory :employee do 
    employee_category  
    employee_number{ "123-456" }  
    joining_date{  6.years.ago }  
    first_name{ "James" }  
    middle_name{ "Lee" }  
    last_name{ "Doe" }  
    gender{  true }  
    job_title{ "Safty Manager" }  
    employee_position  
    employee_department 
    # reporting_manager
    employee_grade 
    qualification{ "Masters Degree" }  
    experience_detail {"Advanced with 12 years of experience"}  
    experience_year{ 1 }  
    experience_month{ 1 }  
    status{  true }  
    status_description{ " Status Description" }  
    date_of_birth{  40.years.ago }  
    marital_status{ "Married" }  
    children_count{ 1 }  
    father_name{ "James Lee Doe Snr." }  
    mother_name{ "Jenny Gabriel Doe" }  
    husband_name{ "Humphrey S." }  
    blood_group{ "Group A" }  
    home_address_line1{ "3 Bank Street" }  
    home_address_line2{ "Capitol" }  
    home_city{ "Washington" }  
    home_state{ "Washington" }  
    # nationality_id {101} 
    # home_country_id {Country.first.id}
    home_pin_code{ "0102" }  
    office_address_line1{ "Capitol Building" }  
    office_address_line2{ "Capitol" }  
    office_city{ "Washington" }  
    office_state{ "Washington" }  
    # office_country_id {Country.first.id}  
    office_pin_code{ "11111" }  
    office_phone1{ "123-456-789" }  
    office_phone2{ "123-456-789" }  
    mobile_phone{ "667-941-484" }  
    home_phone{ "123-456-789" }  
    email{ "employee@lazarus.com" }  
    fax{ "123-456-987" }  
    library_card{ "56897" }  
    # employee_user 
  end

  factory :employee_1, parent: :employee
  factory :reporting_manager, parent: :employee do 
    reporting_manager_id {nil} 
  end
end
