class RoomsController < ApplicationController

	def update
		@room = Room.find(params[:id])
		@room.update(user_id: current_user.id)
		redirect_to :back
	end
end
