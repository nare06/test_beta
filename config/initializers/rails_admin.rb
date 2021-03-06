RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
    # warden.authenticate! scope: :user
  # end
     config.authorize_with :cancan
   config.current_user_method(&:current_user)
config.included_models = ['User', 'Event','Authorization','Category','Micropost','Relationship',
'Eligible','Domain','Pushid','Favorite','Followfeed','Share',
'Reach','Role', 'Campus', 'Group']
  ## == Cancan ==

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
