require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      let!(:prince) {Artist.create!(name: 'Prince')}
      let!(:purple) {prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 1231)}
      let!(:beret){prince.songs.create!(title: 'Raspberry Beret', length: 123, play_count: 125)}
      let!(:beret2){prince.songs.create!(title: 'Raspberry Beret2', length: 2, play_count: 12)}

      it 'returns the average song length' do
        expect(prince.average_song_length).to eq(323.33)
      end
    end
  end
end