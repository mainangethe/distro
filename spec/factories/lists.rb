FactoryBot.define do
  factory :list do
    name { "MyString" }
    list_type { 1 }
    status { 1 }
    campaign { nil }
  end
end
