FactoryGirl.define do
  factory :category do
    sequence(:name) {|n| "Category Title #{n}"}
    description "Sample Category Description"
  end
end
