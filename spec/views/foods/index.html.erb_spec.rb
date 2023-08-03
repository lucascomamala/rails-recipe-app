require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:foods, [
             Food.create!(
               name: 'Bananas',
               measurement_unit: 'kg',
               price: 1.5,
               quantity: 2,
                user: user
             ),
             Food.create!(
               name: 'Milk',
               measurement_unit: 'ml',
               price: 9.99,
               quantity: 3,
               user: user
             )
           ])
  end

  it 'renders a list of foods' do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: /Bananas|Milk/, count: 2
    assert_select cell_selector, text: /kg|ml/, count: 2
    assert_select cell_selector, text: /1.5|9.99/, count: 2
    assert_select cell_selector, text: /2|3/, count: 2
  end
end
