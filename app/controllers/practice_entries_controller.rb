class PracticeEntriesController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  before_filter :authenticate_user!  
  nested_belongs_to :user, :optional => true

  before_filter :find_user
  
  def index   
    @entries = @user.practice_entries
    
    @total_hours = 0
    @entries.each do |p|
      @total_hours += BigDecimal.new(p.hours)
    end
        
    if params[:month]
      @date = Date.strptime(params[:month], "%Y-%m")
    else
      @date = Date.today
    end
  end
  
  def create
    p = params[:practice_entry]
    params[:practice_entry][:date] =  Date::civil(p["date(1i)"].to_i, p["date(2i)"].to_i, p["date(3i)"].to_i)    

    @user.practice_entries << PracticeEntry.new(params[:practice_entry])
    
    if @user.save   
      flash[:notice] = "Practice Entry successfully saved"      
    else 
      flash[:alert] = "There was a problem saving your practice entry. Please try again"
    end
       
    redirect_to practice_entries_path
  end
  
private
  def find_user
     @user = params[:user_id] ? User.find(params[:user_id]) : current_user    
  end  
end
