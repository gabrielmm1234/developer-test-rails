require 'rails_helper'

RSpec.describe WebPage, type: :model do
  it "Is invalid without attributes" do
    expect(WebPage.new).to_not be_valid
  end

  it "Is valid with valid attributes" do
   web_page = FactoryGirl.create :web_page
   expect(web_page).to be_valid
 end
end
