FactoryBot.define do
  factory :recipe do
    name { 'Scrambled Eggs' }
    preparation_time { 10 }
    cooking_time { 15 }
    description { 'Scramble them eggs' }
    public { true }
  end
end
