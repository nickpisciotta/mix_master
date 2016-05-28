require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they change one of the artist's fields" do
    artist1 = Artist.create(name: "Paul McCartney", image_path: "https://lh3.googleusercontent.com/-b_cW_kuSoBY/AAAAAAAAAAI/AAAAAAAAOP8/vnVyKOAaDAA/s0-c-k-no-ns/photo.jpg")
    updated_name = "Beyonce"

    visit artist_path(artist1)
    click_on "Edit"
    fill_in "artist_name", with: updated_name
    click_on "Update Artist"

    expect(page).to have_content updated_name
    expect(page).to_not have_content artist1.name
    expect(page).to have_css("img[src=\"#{artist1.image_path}\"]")
  end
end
