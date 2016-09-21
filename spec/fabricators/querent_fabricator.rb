Fabricator(:querent) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  moniker { Faker::Hacker.noun }
  phone { Faker::PhoneNumber.phone_number }
  email { Faker::Internet.email }
  password { 'password' }
  password_confirmation { 'password' }
end
