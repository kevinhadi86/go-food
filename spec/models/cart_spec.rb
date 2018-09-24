require 'rails_helper'

describe Cart do
  it "has a valid factory" do
    expect(build(:cart)).to be_valid
  end

  it "deletes line_items when deleted" do
    cart = create(:cart)
    food1 = create(:food)
    food2 = create(:food)
    
    line_item1 = create(:line_item, cart: cart, food: food1)
    line_item2 = create(:line_item, cart: cart, food: food2)
    cart.line_items << line_item1
    cart.line_items << line_item2


    expect { cart.destroy }.to change { LineItem.count }.by(-2)
  end
  it "can't be destroyed while it has line_item(s)" do
    cart = create(:cart)
    food = create(:food)
    
    line_item = create(:line_item, cart: cart, food: food)
    food.line_items << line_item

    expect { food.destroy }.not_to change(Food, :count)
  end
  it "does not change the number of line_item if the same food is added" do
    cart = create(:cart)
    food = create(:food, name: "Nasi Uduk")
    line_item = create(:line_item, food: food, cart: cart)

    expect { cart.add_food(food) }.not_to change(LineItem, :count)
  end

end
