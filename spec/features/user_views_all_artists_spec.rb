require 'rails_helper'

RSpec.feature "User can view all artists" do
  scenario " names link to artist's page" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist2 = Artist.create(name: "Paul McCartney", image_path: "https://lh3.googleusercontent.com/-b_cW_kuSoBY/AAAAAAAAAAI/AAAAAAAAOP8/vnVyKOAaDAA/s0-c-k-no-ns/photo.jpg")


    visit artists_path
    expect(page).to have_content artist1.name
    expect(page).to have_content artist2.name
  end

  scenario "click on artist to see their page" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artists_path
    click_on artist1.name
    
    expect(page).to have_content artist1.name
  end
end
