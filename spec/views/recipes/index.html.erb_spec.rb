require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:recipes, [
             Recipe.create!(
               name: 'Mashed Potatoes',
               preparation_time: 2,
               cooking_time: 3,
               description: 'Mash them potatoes',
               public: false,
               user:
             ),
             Recipe.create!(
               name: 'Steak and Yams',
               preparation_time: 24,
               cooking_time: 32,
               description: 'Yummy!',
               public: false,
               user:
             )
           ])
  end

  it 'renders a list of recipes' do
    render
    assert_select '.card .card-body', count: 2
    assert_select 'h3.card-title', count: 2
    assert_select 'p.card-text', count: 2
    assert_select 'h6.card-subtitle', count: 2
    assert_select 'a.card-link', text: 'Edit recipe', count: 2
    assert_select 'a.card-link.text-danger', text: 'Delete recipe', count: 2
  end
end
