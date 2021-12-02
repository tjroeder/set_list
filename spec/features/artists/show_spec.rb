require 'rails_helper'

RSpec.describe '/artists/show.html.erb', type: :feature do
  describe 'when a user' do
    it 'displays the artists name' do
      artist_1 = Artist.create!(name: 'The Beatles')
      artist_2 = Artist.create!(name: 'Taco')

      visit "/artists/#{artist_1.id}"
      save_and_open_page
      
      expect(page).to have_content(artist_1.name)
      expect(page).to have_no_content(artist_2.name)
    end
    
    it 'shows the average song length' do
      artist_1 = Artist.create!(name: 'The Beatles')
      artist_2 = Artist.create!(name: 'Taco')

      song_1     = artist_1.songs.create!(title: 'Yellow Submarine', length: 200, play_count: 100)
      song_2   = artist_1.songs.create!(title: 'Hey Jude!', length: 300, play_count: 200)

      visit "/artists/#{artist_1.id}"
      save_and_open_page
      
      expect(page).to have_content('Average song length: 250')
    end
    
    it 'shows the total song count' do
      artist_1 = Artist.create!(name: 'The Beatles')
      artist_2 = Artist.create!(name: 'Taco')
  
      song_1     = artist_1.songs.create!(title: 'Yellow Submarine', length: 200, play_count: 100)
      song_2   = artist_1.songs.create!(title: 'Hey Jude!', length: 300, play_count: 200)
  
      visit "/artists/#{artist_1.id}"
      save_and_open_page

      expect(page).to have_content('Total song count: 300')
    end
  end
end