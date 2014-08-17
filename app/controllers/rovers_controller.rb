class RoversController < ApplicationController
	
  def index
  	@rover = []
  end
  
  def calculate
  	p @coords = params[:coords]
  	redirect_to root_url
  end
	
end
