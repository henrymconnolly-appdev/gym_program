Rails.application.routes.draw do
  root :to => "profiles#index"
  # Routes for the Newsfeed resource:

  # CREATE
  get("/newsfeeds/new", { :controller => "newsfeeds", :action => "new_form" })
  post("/create_newsfeed", { :controller => "newsfeeds", :action => "create_row" })

  # READ
  get("/newsfeeds", { :controller => "newsfeeds", :action => "index" })
  get("/newsfeeds/:id_to_display", { :controller => "newsfeeds", :action => "show" })

  # UPDATE
  get("/newsfeeds/:prefill_with_id/edit", { :controller => "newsfeeds", :action => "edit_form" })
  post("/update_newsfeed/:id_to_modify", { :controller => "newsfeeds", :action => "update_row" })

  # DELETE
  get("/delete_newsfeed/:id_to_remove", { :controller => "newsfeeds", :action => "destroy_row" })

  #------------------------------

  # Routes for the Profile resource:

  # CREATE
  get("/profiles/new", { :controller => "profiles", :action => "new_form" })
  post("/create_profile", { :controller => "profiles", :action => "create_row" })

  # READ
  get("/profiles", { :controller => "profiles", :action => "index" })
  get("/profiles/:id_to_display", { :controller => "profiles", :action => "show" })

  # UPDATE
  get("/profiles/:prefill_with_id/edit", { :controller => "profiles", :action => "edit_form" })
  post("/update_profile/:id_to_modify", { :controller => "profiles", :action => "update_row" })

  # DELETE
  get("/delete_profile/:id_to_remove", { :controller => "profiles", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
