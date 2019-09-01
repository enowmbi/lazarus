FactoryBot.define do 
  factory :admin do 
    sequence(:username){|n| "john_doe_#{n}"}

    first_name{"John "}

    last_name{"doe"}

    email{"#{username}@example.com"}

    admin{true}

    student{false}

    employee {false}

    password {"jojo"}

    salt{"jesus is lord"}

    school

    parent {false}

    is_deleted{false}
  end

  factory :student_user, parent: :admin do 
     student {true}
     admin{false}
  end

end
