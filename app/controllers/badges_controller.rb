class BadgesController < ApplicationController
	def index
		@badges = current_user.achievements
	end
end