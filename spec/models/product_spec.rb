require 'rails_helper'
# create buat record di database
# build hanya buat record di memory
RSpec.describe Product, type: :model do
  it 'has a valid title' do
    expect(create(:product)).to be_valid
  end
  it 'has invalid title' do
    expect(build(:product,title: nil)).not_to be_valid
  end
  it 'may search by price' do
    product = build(:product)
    expect(Product.where(price: 8.2)).to be_truthy
  end

  it "reject invalid image url" do
    image_url = build(:product,:with_invalid_image_url)
     expect(image_url).not_to be_valid
  end
end
