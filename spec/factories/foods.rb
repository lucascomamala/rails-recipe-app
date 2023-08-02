FactoryBot.define do
  factory :food do
    name { 'Eggs' }
    measurement_unit { 'unit' }
    price { 9.99 }
    quantity { 2 }
  end
end
