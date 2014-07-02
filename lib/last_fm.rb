require 'lastfm-client'

module LastFm

	LastFM.api_key = "668c781b96bd2dc3e77513dbebff9044"
	LastFM.client_name = "flocka"

	def self.get_similar_tracks track, artist
		begin
			similar_tracks = LastFM::Track.get_similar(:track => track, :artist => artist)["similartracks"]["track"].first(10)
		rescue
			similar_tracks = "nil"
		end
		return similar_tracks
	end

end

