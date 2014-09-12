# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    thoughts "MyText"
    rating 	 "2"
    user_id   1
  end

end
