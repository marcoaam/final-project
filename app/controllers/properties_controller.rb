class PropertiesController < ApplicationController

	def new
		@property = Property.new
	end

	def index
		@properties = Property.all
	end
	
end
