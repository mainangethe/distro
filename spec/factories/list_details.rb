FactoryBot.define do
  factory :list_detail do
    first_name { "MyString" }
    middle_name { "MyString" }
    last_name { "MyString" }
    gender { 1 }
    identification_type { 1 }
    identification_number { "MyString" }
    phone_number { "MyString" }
    email_address { "MyString" }
    physical_location { "MyString" }
    status { 1 }
    list { nil }
  end
end
