FactoryBot.define do 
  factory :school do 
    sequence(:name) {|n| "Institute of Technology #{n}"}
    sequence(:code) {|n| "IoT #{n}"}
  end 
end


