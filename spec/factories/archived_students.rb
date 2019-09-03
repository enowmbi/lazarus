FactoryBot.define do 
  factory :archived_student do 
    admission_no {"12345"}
    class_roll_no {"12345"}
    admission_date { Time.now }
    first_name {"John " }
    middle_name {" Matter "}
    last_name { "Doe" }
    batch
    date_of_birth {Time.now }
    gender {"male"}
    blood_group {"A"}
    birth_place {"Manchester"}
    country
    language {"English"}
    religion {"Christianity"}
    student_category
    address_line1 {"Address 1"}
    address_line2 {"Chicago"}
    city {"Chicago"}
    state {"Ilinois"}
    pin_code {"1234"}
    country
    phone1 {"123456789"}
    phone2 {"123456789"}
    email {"john_doe@example.com"}
    immediate_contact
    is_sms_enabled {true}
    status_description {"Single"}
    is_active {true}
    is_deleted {false}
    library_card {"xyz"}
    has_paid_fees { true }
    user
    passport_number { "text" }
    enrollment_date { Time.now }
    school
  end
end
