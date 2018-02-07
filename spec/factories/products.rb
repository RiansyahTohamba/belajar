FactoryBot.define do
  factory :product do
    title "Agile With Rails"
    description "A good book always good"
    image_url "rails.jpg"
    price 8.2
    # trait coba-coba dengan kombinasi kolom lain
    trait :with_invalid_image_url do
      image_url "rails.xlsx"
    end

    trait :price_on_view do
      price "$ 20.02"
    end
  end
end
