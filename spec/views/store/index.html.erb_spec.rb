require 'spec_helper'
require 'capybara/rspec'

feature "View List Product For Customer" do
      scenario 'Display List Of Product' do
        visit store_index_path
        page.first('.price',text: /\$[,\d]+\.\d\d/)
      end
end
