FactoryBot.define do
  factory :campaign do
    name { "MyString" }
    campaign_type { 1 }
    check_level { 1 }
    status { 1 }
    entity { nil }
  end
end
