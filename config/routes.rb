OpenProject::Application.routes.draw do
  root :to => 'welcome#index'
  get '/robots.txt' => 'welcome#robots', :format => :text

  resources :news
  # match '/news/preview' => 'previews#news', :as => :preview_news
  
  # match 'news/:id/comments' => 'comments#create', :via => :post
  # match 'news/:id/comments/:comment_id' => 'comments#destroy', :via => :delete

  #   resources :news
  
  # match 'projects/:project_id/news/:action' => 'news#index'




  resources :activities
  # match 'projects/:id/activity' => 'activities#index', :via => :get
  # match 'projects/:id/activity.:format' => 'activities#index', :via => :get
  # match 'activity' => 'activities#index', :id => nil, :via => :get
  # match 'activity.:format' => 'activities#index', :id => nil, :via => :get


  









  # match 'login' => 'account#login', :as => :signin
  # match 'logout' => 'account#logout', :as => :signout
  # match 'roles/workflow/:id/:role_id/:tracker_id' => 'roles#workflow'
  # match 'help/:ctrl/:page' => 'help#index'
  # match 'projects/:project_id/issues/:issue_id/time_entries/report' => 'time_entry_reports#report', :via => :get
  # match 'projects/:project_id/issues/:issue_id/time_entries/report.:format' => 'time_entry_reports#report', :via => :get
  # match 'projects/:project_id/time_entries/report' => 'time_entry_reports#report', :via => :get
  # match 'projects/:project_id/time_entries/report.:format' => 'time_entry_reports#report', :via => :get
  # match 'time_entries/report' => 'time_entry_reports#report', :via => :get
  # match 'time_entries/report.:format' => 'time_entry_reports#report', :via => :get
  # resources :time_entries
  # resource :wiki_menu_item, :only => [:edit, :update]
  # match 'projects/:project_id/wiki/new' => 'wiki#new', :as => :wiki_new, :via => :get
  # match 'projects/:project_id/wiki/new' => 'wiki#create', :as => :wiki_create, :via => :post
  # match 'projects/:project_id/wiki/preview' => 'wiki#preview', :as => :wiki_preview, :via => :post
  # match 'projects/:project_id/wiki/:id/new' => 'wiki#new_child', :as => :wiki_new_child, :via => :get
  # match 'projects/:project_id/wiki/:id/toc' => 'wiki#index', :as => :wiki_page_toc, :via => :get
  # match 'projects/:id/wiki' => 'wikis#edit', :via => :post
  # match 'projects/:id/wiki/destroy' => 'wikis#destroy', :via => :get
  # match 'projects/:id/wiki/destroy' => 'wikis#destroy', :via => :post
  # match 'boards/:board_id/topics/new' => 'messages#new', :via => :get
  # match 'boards/:board_id/topics/:id' => 'messages#show', :via => :get
  # match 'boards/:board_id/topics/:id/edit' => 'messages#edit'
  # match 'boards/:board_id/topics/new' => 'messages#new', :via => :post
  # match 'boards/:board_id/topics/:id/replies' => 'messages#reply', :via => :post
  # match 'boards/:board_id/topics/:id/destroy' => 'messages#destroy', :via => :post
  # match 'projects/:project_id/boards' => 'boards#index', :via => :get
  # match 'projects/:project_id/boards/new' => 'boards#new', :via => :get
  # match 'projects/:project_id/boards/:id' => 'boards#show', :via => :get
  # match 'projects/:project_id/boards/:id.:format' => 'boards#show', :via => :get
  # match 'projects/:project_id/boards/:id/edit' => 'boards#edit'
  # match 'projects/:project_id/boards' => 'boards#new', :via => :post
  # match 'projects/:project_id/boards/:id/destroy' => 'boards#destroy', :via => :post
  # match 'projects/:project_id/documents' => 'documents#index', :via => :get
  # match 'projects/:project_id/documents/new' => 'documents#new', :via => :get
  # match 'documents/:id' => 'documents#show', :via => :get
  # match 'documents/:id/edit' => 'documents#edit'
  # match 'projects/:project_id/documents' => 'documents#new', :via => :post
  # match 'documents/:id/destroy' => 'documents#destroy', :via => :post  
  # resources :issue_moves, :only => [:new, :create]
  # match '/issues/auto_complete' => 'auto_completes#issues', :as => :auto_complete_issues
  # match '/issues/preview/:id' => 'previews#issue', :as => :preview_issue
  # match '/issues/context_menu' => 'context_menus#issues', :as => :issues_context_menu
  # match '/issues/changes' => 'journals#index', :as => :issue_changes
  # match 'issues/bulk_edit' => 'issues#bulk_edit', :as => :bulk_edit_issue, :via => :get
  # match 'issues/bulk_edit' => 'issues#bulk_update', :as => :bulk_update_issue, :via => :post
  # match '/issues/:id/quoted' => 'journals#new', :as => :quoted_issue, :id => /\d+/, :via => :post
  # match '/issues/:id/destroy' => 'issues#destroy', :via => :post
  # resource :gantt, :only => [:show, :update]
  # resource :gantt, :only => [:show, :update]
  # resource :calendar, :only => [:show, :update]
  # resource :calendar, :only => [:show, :update]
  # match 'projects/:id/issues/report' => 'reports#issue_report', :via => :get
  # match 'projects/:id/issues/report/:detail' => 'reports#issue_report_details', :via => :get
  # match '/issues' => 'issues#index', :via => :post
  # match '/issues/create' => 'issues#index', :via => :post
  # resources :issues do
  #   collection do
  # end
  #   member do
  # post :edit
  # end
  #     resources :time_entries
  # end
  # 
  # resources :issues do
  #   collection do
  # post :create
  # get :all
  # end
  # 
  #     resources :time_entries
  # end
  # 
  # match 'issues/:issue_id/relations/:id' => 'issue_relations#new', :via => :post
  # match 'issues/:issue_id/relations/:id/destroy' => 'issue_relations#destroy', :via => :post
  # match 'projects/:id/members/new' => 'members#new'
  # match 'users/:id/edit/:tab' => 'users#edit', :tab => nil, :via => :get
  # match 'users/:id/memberships' => 'users#edit_membership', :via => :post
  # match 'users/:id/memberships/:membership_id' => 'users#edit_membership', :via => :post
  # match 'users/:id/memberships/:membership_id/destroy' => 'users#destroy_membership', :via => :post
  # resources :users do
  # 
  #   member do
  # post :edit_membership
  # post :destroy_membership
  # get :deletion_info
  # end
  # 
  # end
  # 
  # match 'projects/:project_id/roadmap' => 'versions#index'

  ## news
  
  # resources :projects do
  # 
  #   member do
  # get :copy
  # post :copy
  # get :settings
  # post :modules
  # post :archive
  # post :unarchive
  # end
  #     resource :project_enumerations, :only => [:update, :destroy]
  #   resources :files, :only => [:index, :new, :create]
  #   resources :versions do
  #       collection do
  #   put :close_completed
  #   end
  #       member do
  #   post :status_by
  #   end
  #   
  #   end
  # 
  #   resources :time_entries
  #   match 'wiki' => 'wiki#show', :as => :wiki_start_page, :via => :get
  #   match 'wiki/index' => 'wiki#index', :as => :wiki_index, :via => :get
  #   match 'wiki/:id/diff/:version' => 'wiki#diff', :as => :wiki_diff, :version => nil
  #   match 'wiki/:id/diff/:version/vs/:version_from' => 'wiki#diff', :as => :wiki_diff
  #   match 'wiki/:id/annotate/:version' => 'wiki#annotate', :as => :wiki_annotate
  #   resources :wiki, :except => [:new, :create] do
  #       collection do
  #   get :export
  #   get :date_index
  #   end
  #       member do
  #   get :rename
  #   post :rename
  #   get :history
  #   match :preview
  #   post :protect
  #   post :add_attachment
  #   end
  #   
  #   end
  # end
  # 
  # match 'projects/:id/destroy' => 'projects#destroy', :as => :project_destroy_confirm, :via => :get
  # match 'projects/:id/settings/:tab' => 'projects#settings', :via => :get
  # match 'projects/:project_id/issues/:copy_from/copy' => 'issues#new', :via => :get
  # match 'projects/:project_id/issue_categories/new' => 'issue_categories#new'
  # match 'projects/:id/repository' => 'repositories#show', :via => :get
  # match 'projects/:id/repository/edit' => 'repositories#edit', :via => :get
  # match 'projects/:id/repository/statistics' => 'repositories#stats', :via => :get
  # match 'projects/:id/repository/revisions' => 'repositories#revisions', :via => :get
  # match 'projects/:id/repository/revisions.:format' => 'repositories#revisions', :via => :get
  # match 'projects/:id/repository/revisions/:rev' => 'repositories#revision', :via => :get
  # match 'projects/:id/repository/revisions/:rev/diff' => 'repositories#diff', :via => :get
  # match 'projects/:id/repository/revisions/:rev/diff.:format' => 'repositories#diff', :via => :get
  # match 'projects/:id/repository/revisions/:rev/raw/*path' => 'repositories#entry', :format => 'raw', :constraints => { :rev => /[a-z0-9\.\-_]+/ }, :via => :get
  # match 'projects/:id/repository/revisions/:rev/:action/*path' => 'repositories#index', :constraints => { :rev => /[a-z0-9\.\-_]+/ }, :via => :get
  # match 'projects/:id/repository/raw/*path' => 'repositories#entry', :format => 'raw', :via => :get
  # match 'projects/:id/repository/entry/*path' => 'repositories#entry', :via => :get
  # match 'projects/:id/repository/:action/*path' => 'repositories#index', :via => :get
  # match 'projects/:id/repository/:action' => 'repositories#index', :via => :post
  # match 'attachments/:id' => 'attachments#show', :id => /\d+/
  # match 'attachments/:id/:filename' => 'attachments#show', :id => /\d+/, :filename => /.*/
  # match 'attachments/download/:id/:filename' => 'attachments#download', :id => /\d+/, :filename => /.*/
  # resources :groups
  # match 'projects/:project_id/issues/:action' => 'issues#index'
  # match 'projects/:project_id/documents/:action' => 'documents#index'
  # match 'projects/:project_id/boards/:action/:id' => 'boards#index'
  # match 'boards/:board_id/topics/:action/:id' => 'messages#index'
  # match 'wiki/:id/:page/:action' => 'wiki#index', :page => nil
  # match 'issues/:issue_id/relations/:action/:id' => 'issue_relations#index'
  # match 'projects/:project_id/timelog/:action/:id' => 'timelog#index', :project_id => /.+/
  # match 'repositories/browse/:id/*path' => 'repositories#browse', :as => :repositories_show
  # match 'repositories/changes/:id/*path' => 'repositories#changes', :as => :repositories_changes
  # match 'repositories/diff/:id/*path' => 'repositories#diff', :as => :repositories_diff
  # match 'repositories/entry/:id/*path' => 'repositories#entry', :as => :repositories_entry
  # match 'repositories/annotate/:id/*path' => 'repositories#annotate', :as => :repositories_entry
  # match 'repositories/revision/:id/:rev' => 'repositories#revision'
  # match 'sys/projects.:format' => 'sys#projects', :via => :get
  # match 'sys/projects/:id/repository.:format' => 'sys#create_project_repository', :via => :post
  # match 'deletion_info' => 'users#deletion_info', :as => :delete_my_account_info, :path_prefix => 'my', :via => :get
  # match '/:controller(/:action(/:id))'
  # match '/' => 'account#login'
end
