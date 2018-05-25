require 'rails_helper'

RSpec.feature "IngredientsFeatures", type: :feature do
  describe "ingredient creation", type: :feature do
    before do
      visit new_user_ingredient_path_path
      fill_in "Name", with: "chocolate"
      fill_in "4 oz", from: 'quantity'
      click_button "Create Ingredient"
    end

  let(:ingredient) {
    Ingredient.find_by(name: 'chocolate')}
    it 'creates an ingredient' do
      expect(ingredient).to_not be_nil
    end

    it 'redirects to the new ingredient show page' do
      expect(current_path).to eq(ingredient_path(ingredient))
    end

    it 'displays the ingredient name' do
      within 'h1' do
        expect(page).to have_content(ingredient.name)
      end
    end
  end
end
