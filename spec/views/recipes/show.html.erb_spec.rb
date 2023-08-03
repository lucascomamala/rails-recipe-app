require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:recipe, Recipe.create!(
                      name: 'Name',
                      preparation_time: 2,
                      cooking_time: 3,
                      description: 'MyText',
                      public: true,
                      user: user
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Public/)
  end
end
