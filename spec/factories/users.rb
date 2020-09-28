FactoryGirl.define do
  factory :user_1, class: User do
    login 'hernan'
    password '123456'
    token '123'
  end

  factory :user_2, class: User do
    login 'camilo'
    password '123456'
    token '345'
  end
end