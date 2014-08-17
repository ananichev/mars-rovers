class RoversController < ApplicationController

  NEWS = ["N", "E", "S", "W"]
	
  def index
	@coords = session[:coords]
	session[:coords] = nil
  end
  
  def calculate
  	@coords = params[:coords].split
    @actions = params[:actions].split(/d*/)
  	@coords = @coords[0, 2].map(&:to_i) << @coords[-1]
  	
    @actions.each do |a|
      if a == "M"
  	    @coords[1] += 1 if @coords[-1] == "N"
  	    @coords[0] += 1 if @coords[-1] == "E"
  	    @coords[1] -= 1 if @coords[-1] == "S"
  	    @coords[0] -= 1 if @coords[-1] == "W"
  	  elsif a == "L"
  	    l = NEWS.index(@coords[-1]) - 1
  	    @coords[-1] = NEWS[l]
  	  elsif a == "R"
  	    r = NEWS.index(@coords[-1]) + 1
  	    if @coords[-1] == "W"
  	      @coords[-1] = NEWS[0]
  	    else 
  	      @coords[-1] = NEWS[r]
  	    end
      end
      next
    end
    
  	session[:coords] = @coords
  	redirect_to root_url
  end
	
end
