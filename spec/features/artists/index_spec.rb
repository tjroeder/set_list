require 'rails_helper'

RSpec.describe '/artists/index.html.erb', type: :feature do
  describe 'as a user' do
    describe 'when visit /artists' do
      it 'displays a list of artists names' do
        artist_1 = Artist.create!(name: "The Beatles")
        artist_2 = Artist.create!(name: 'Reel Big Fish')

        visit '/artists' 
        save_and_open_page

        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
      end
    end
  end
end