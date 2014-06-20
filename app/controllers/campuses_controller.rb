class CampusesController < ApplicationController
def new
@campus = Campus.new
end
def show
@campus = Campus.friendly.find(params[:id])
@events = Event.new
     @events = @campus.events
    #@events = Event.where("workflow_state=? and edatetime > ?","accept", Time.now).reverse
   # @events = Event.where("sdatetime > ? and sdatetime < ?", Time.now.beginning_of_day + num.day, Time.now.end_of_day + num.day) if num.present?
    @tab1 = Event.where("reach_id = 1 and workflow_state=? and edatetime > ?","accept",Time.now).sort_by{|u| u.updated_at}.reverse     
    @tab2   = Event.where("reach_id = 2 and workflow_state=? and edatetime > ?","accept", Time.now ).reverse 
    @tab5   = Event.where("workflow_state=? and edatetime > ?","accept", Time.now).sort_by{|u| u.shared_by.count}.reverse
###allevents
    #@events = Event.all.paginate(:page => params[:page], :per_page => 7)
    @user = current_user || User.new
    @auth = @user.authorizations
    @cat_array  = @user.categories #.collect{|p| p.id}
    @dom_array   = @user.domains
    @eli_array  = @user.eligibles
    
    @categor =[]
    @domai = []
    @eligibl = []
         
    @cat_array.each do |u|    
            @cat = Category.find(u.id)
            @categor = @categor << @cat.events.where("workflow_state=? and edatetime > ?","accept", Time.now).pluck(:id)       
        end
 
     @dom_array.each do |u|    
            @dom = Domain.find(u.id)
            @domai = @domai << @dom.events.where("workflow_state=? and edatetime > ?","accept", Time.now).pluck(:id) 
   
           end
        
      @eli_array.each do |u|    
            @eli = Eligible.find(u.id)
            @eligibl = @eligibl << @eli.events.where("workflow_state=? and edatetime > ?","accept", Time.now).pluck(:id) 
              end
    
         @events_array = @categor.flatten << @eligibl.flatten << @domai.flatten
         ids = @events_array.flatten
         sorted_ids = ids.sort_by{|id| ids.select{|id2| id2 == id}.size}.reverse.uniq
         records = Event.find(sorted_ids).group_by(&:id)
         @tab3 = sorted_ids.map { |id| records[id].first }
    @tab4 = @user.userfavorites.where("workflow_state=? and edatetime > ?","accept", Time.now).reverse 
    @tab6 = @user.usershares.where("workflow_state=? and edatetime > ?","accept", Time.now).reverse
    @tab7 = @user.events.reverse
end
def create
@campus = Campus.new
end

end
