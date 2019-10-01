FactoryBot.define do
    factory :task do
        sequence(:title) { |n| "TEST_title#{n}" }
        sequence(:content) { |n| "TEST_content#{n}" }
    end
end
