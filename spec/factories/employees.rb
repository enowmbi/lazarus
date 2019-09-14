FactoryBot.define do 
  factory :employee do 
    employee_category_id{ 1 }  
    employee_number{ "string" }  
    joining_date{  1979-02-28 }  
    first_name{ "string" }  
    middle_name{ "string" }  
    last_name{ "string" }  
    gender{  true }  
    job_title{ "string" }  
    employee_position_id{ 1 }  
    employee_department_id{ 1 }  
    employee_grade_id{ 1 }  
    qualification{ "string" }  
    experience_detail {"text"}  
    experience_year{ 1 }  
    experience_month{ 1 }  
    status{  true }  
    status_description{ "string" }  
    date_of_birth{  1979-03-28 }  
    marital_status{ "string" }  
    children_count{ 1 }  
    father_name{ "string" }  
    mother_name{ "string" }  
    husband_name{ "string" }  
    blood_group{ "string" }  
    home_address_line1{ "string" }  
    home_address_line2{ "string" }  
    home_city{ "string" }  
    home_state{ "string" }  
    nationality_id {Country.first.id} 
    home_country_id {Country.first.id}
    home_pin_code{ "string" }  
    office_address_line1{ "string" }  
    office_address_line2{ "string" }  
    office_city{ "string" }  
    office_state{ "string" }  
    office_country_id {Country.first.id}  
    office_pin_code{ "string" }  
    office_phone1{ "string" }  
    office_phone2{ "string" }  
    mobile_phone{ "string" }  
    home_phone{ "string" }  
    email{ "employee@lazarus.com" }  
    fax{ "string" }  
    library_card{ "string" }  
    user_id{ 1 }  
    school_id{ 1 }
  end

  factory :employee_1, parent: :employee
end
