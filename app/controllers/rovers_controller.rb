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
      if @coords[-1] == "N"
  	    if a == "M"
  	      @coords[1] += 1
  	    elsif a == "L"
  	      l = NEWS.index(@coords[-1]) - 1
  	      p @coords[-1] = NEWS[l]
  	    elsif a == "R"
  	      r = NEWS.index(@coords[-1]) + 1
  	      @coords[-1] = NEWS[r]
        end
        next
      end
  
      if @coords[-1] == "E"
  	    if a == "M"
  	      @coords[0] += 1
  	    elsif a == "L"
  	      l = NEWS.index(@coords[-1]) - 1
  	      @coords[-1] = NEWS[l]
  	    elsif a == "R"
  	      r = NEWS.index(@coords[-1]) + 1
  	      @coords[-1] = NEWS[r]
        end
        next
      end
  
      if @coords[-1] == "S"
  	    if a == "M"
  	      @coords[1] -= 1
  	    elsif a == "L"
  	      l = NEWS.index(@coords[-1]) - 1
  	      @coords[-1] = NEWS[l]
  	    elsif a == "R"
  	      r = NEWS.index(@coords[-1]) + 1
  	      @coords[-1] = NEWS[r]
        end
        next
      end
  
      if @coords[-1] == "W"
  	    if a == "M"
  	      @coords[0] -= 1
  	    elsif a == "L"
  	      l = NEWS.index(@coords[-1]) - 1
  	      @coords[-1] = NEWS[l]
  	    elsif a == "R"
  	      @coords[-1] = NEWS[0]
        end
        next
      end
    end
  	p session[:coords] = @coords
  	redirect_to root_url
  end
	
end
