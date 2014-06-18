class GroupsController < ApplicationController
def index
@campus = Campus.friendly.find(params[:campu_id])
@events = Event.all    # in campus
@groups = Group.all    # in campus
end
def show
@campus = Campus.friendly.find(params[:campu_id])
@events = Group.all
@user = current_user || User.new
end
def new

#@campus= Campus.friendly.find(params[:campu_id])
@group = Group.new
#@group.campus_id = @campus.id
end
def create
    @group = Group.new         
       respond_to do |format|
      if @group.save
            
     # debugger
        format.html { redirect_to @group, notice: 'Group Created' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
   
       
 end
  
end
