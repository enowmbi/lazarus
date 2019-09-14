FactoryBot.define do 
  factory :country do 
    name {"Cameroon"}
  end
  factory :nationality,parent: :country do 
    name {"USA"}
  end

  factory :office_country, parent: :country do 
    name {"Sweden"}
  end

  factory :home_country, parent: :country do 
    name {"Switzerland"}
  end

end
