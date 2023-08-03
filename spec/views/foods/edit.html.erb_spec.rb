require 'rails_helper'

RSpec.describe 'foods/edit', type: :view do
  let(:user) { create(:user) }

  let(:food) do
    Food.create!(
      name: 'MyString',
      measurement_unit: 'MyString',
      price: '9.99',
      quantity: 1,
      user: user
    )
  end

  before(:each) do
    assign(:food, food)
  end

  it 'renders the edit food form' do
    render

    assert_select 'form[action=?][method=?]', food_path(food), 'post' do
      assert_select 'input[name=?]', 'food[price]'

      assert_select 'input[name=?]', 'food[quantity]'
    end
  end
end
