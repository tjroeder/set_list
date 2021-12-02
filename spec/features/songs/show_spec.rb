require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 200, play_count: 245635741)

    visit "/songs/#{song.id}" 

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 200, play_count: 245635741)
    
    visit "/songs/#{song.id}"
    save_and_open_page
    
    expect(page).to have_content(artist.name)
  end
  
  it 'has a link to take the user back to the song index page' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 200, play_count: 245635741)

    visit "/songs/#{song.id}"
    
    expect(page).to have_link("Back to Index", :href=>"/songs")
  end
  
  it "when the link 'Back to Index' to clicked, user is taken back to songs index" do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 200, play_count: 245635741)
  
    visit "/songs/#{song.id}"
    click_link "Back to Index"

    expect(page).to have_current_path('/songs')
  end
end