FactoryBot.define do 
  factory :user do 
    sequence(:username){|n| "john_doe_#{n}"}
    first_name{"John "}
    last_name{"doe"}
    email{"#{username}@example.com"}
    admin{false}
    student{false}
    employee {true}
    password {"jojo"}
    salt{"jesus is lord"}
    # school
    parent {false}
    is_deleted{false}
  end

  factory :student_user, parent: :user do 
    sequence(:username){|n| "john_doe_student_#{n}"}
     email {"#{username}@example.com"}
     student {true}
     employee {false}
     admin{false}
     parent{false}
  end

  factory :admin_user, parent: :user do 
    sequence(:username){|n| "john_doe_admin_#{n}"}
     email {"#{username}@example.com"}
    student {false}
    employee {false}
    admin{true}
    parent{false}
  end

  factory :parent_user, parent: :user do 
    sequence(:username){|n| "john_doe_parent_#{n}"}
     email {"#{username}@example.com"}
    student {false}
    employee {false}
    admin{false}
    parent{true}
  end

  factory :employee_user, parent: :user do 
    sequence(:username){|n| "john_doe_employee_#{n}"}
     email {"#{username}@example.com"}
    student {false}
    employee {true}
    admin{false}
    parent{false}
  end

end
