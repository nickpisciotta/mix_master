require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "the can change a song's field" do
  artist = Artist.create(name: "U2", image_path: "http://static.idolator.com/uploads/2014/03/11/U21.jpg")
  song = artist.songs.create(title: "Beautiful Day")

  updated_name = "In the name of love"

  visit song_path(song)
  click_on "Edit"
  fill_in "Title", with: updated_name
  click_on "Update Song"

  expect(page).to have_content updated_name
  expect(page).to_not have_content song.title
  end
end
