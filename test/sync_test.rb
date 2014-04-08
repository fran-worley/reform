require 'test_helper'

class SyncTest < BaseTest
  describe "populated" do
    let (:params) {
      {
        "title" => "Best Of",
        "hit"   => {"title" => "Roxanne"},
        "songs" => [{"title" => "Fallout"}, {"title" => "Roxanne"}]
      }
    }

    let (:album) { Album.new(nil, hit, [song1, song2]) }
    let (:hit) { Song.new }
    let (:song1) { Song.new }
    let (:song2) { Song.new }

    subject { AlbumForm.new(album) }

    before do
      subject.validate(params)
      subject.sync
    end

    it { album.title.must_equal "Best Of" }
  end
end