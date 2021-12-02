require 'rails_helper'

RSpec.describe 'spec/features/artists/songs/index_spec.rb' do
  let!(:prince) {Artist.create!(name: 'Prince')}
  let!(:purple) {prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 1231)}
  let!(:beret){prince.songs.create!(title: 'Raspberry Beret', length: 123, play_count: 125)}

  it 'shows all of the titles of the songs for the artist' do
    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content(purple.title)
    expect(page).to have_content(beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{prince.id}/songs"

    click_on purple.title

    expect(page).to have_current_path("/songs/#{purple.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 484")
  end
end