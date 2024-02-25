FactoryBot.define do
  factory :post do
    title { FFaker::Lorem.word }
    body { FFaker::Lorem.paragraph }
    user
  end
end
