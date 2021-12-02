require 'rails_helper'

RSpec.describe 'Songs index page', type: :feature do
  it 'can see all songs, their titles and play count' do
    # artist = Artist.create(name: "someone")
    song_1 = Song.create( 
                          title:       "I Really Like You",
                          length:      208,
                          play_count:  243810867)

    song_2 = Song.create( 
                          title:       "Call Me Maybe",
                          length:      199,
                          play_count:  1214722172)
                          
    visit '/songs'
    save_and_open_page
    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end