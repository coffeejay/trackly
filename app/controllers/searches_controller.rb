class SearchesController < ApplicationController

	def index
	end


	def get_similar
		
		@track_name = params[:track]
		@artist = params[:artist]

		@similar_tracks = LastFm.get_similar_tracks(@track_name, @artist)
		@images = []
		@errors = []

		if @similar_tracks.is_a? String
			@errors.push("No song found") 
			render 'errors'
			return
		end

		@similar_tracks.each do |t|
			begin
				@images.push(t['image'][2]['#text'])
			rescue 
				@images.push('http://ninjatune.net/files/images/actress/six/cover-placeholder-two.jpg')
			end
		end

	end

end
