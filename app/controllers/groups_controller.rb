class GroupsController < ApplicationController

def show
@campus = Group.friendly.find(params[:id])
@events = Group.all
@user = current_user || User.new
end


end
