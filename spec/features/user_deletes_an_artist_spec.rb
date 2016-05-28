require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they delete an artist from datebase" do
  artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  artist2 = Artist.create(name: "Paul McCartney", image_path: "https://lh3.googleusercontent.com/-b_cW_kuSoBY/AAAAAAAAAAI/AAAAAAAAOP8/vnVyKOAaDAA/s0-c-k-no-ns/photo.jpg")

  visit artist_path(artist1)
  click_on "Delete artist"

  expect(page).to have_content "All Artists"
  expect(page).to have_no_content artist1.name
  end
end
