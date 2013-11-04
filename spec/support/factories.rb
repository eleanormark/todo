FactoryGirl.define do 
  factory :list do
    name "My New List"
  end
end

FactoryGirl.define do
  factory :task do
    name "Scrub the elephant"
    list
  end
end