# This will guess the Bird class
FactoryGirl.define do
  factory :bird do
    name 'Kiwi'
    family 'Apterygidae'
    continents ['Australia']
    visible true
  end
end
