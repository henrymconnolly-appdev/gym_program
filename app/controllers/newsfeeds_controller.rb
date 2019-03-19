class NewsfeedsController < ApplicationController
  before_action :current_user_must_be_newsfeed_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_newsfeed_user
    newsfeed = Newsfeed.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == newsfeed.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @newsfeeds = Newsfeed.page(params[:page]).per(10)

    render("newsfeed_templates/index.html.erb")
  end

  def show
    @newsfeed = Newsfeed.find(params.fetch("id_to_display"))

    render("newsfeed_templates/show.html.erb")
  end

  def new_form
    @newsfeed = Newsfeed.new

    render("newsfeed_templates/new_form.html.erb")
  end

  def create_row
    @newsfeed = Newsfeed.new

    @newsfeed.user_id = params.fetch("user_id")
    @newsfeed.profile_id = params.fetch("profile_id")

    if @newsfeed.valid?
      @newsfeed.save

      redirect_back(:fallback_location => "/newsfeeds", :notice => "Newsfeed created successfully.")
    else
      render("newsfeed_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_profile
    @newsfeed = Newsfeed.new

    @newsfeed.user_id = params.fetch("user_id")
    @newsfeed.profile_id = params.fetch("profile_id")

    if @newsfeed.valid?
      @newsfeed.save

      redirect_to("/profiles/#{@newsfeed.user_id}", notice: "Newsfeed created successfully.")
    else
      render("newsfeed_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @newsfeed = Newsfeed.find(params.fetch("prefill_with_id"))

    render("newsfeed_templates/edit_form.html.erb")
  end

  def update_row
    @newsfeed = Newsfeed.find(params.fetch("id_to_modify"))

    
    @newsfeed.profile_id = params.fetch("profile_id")

    if @newsfeed.valid?
      @newsfeed.save

      redirect_to("/newsfeeds/#{@newsfeed.id}", :notice => "Newsfeed updated successfully.")
    else
      render("newsfeed_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_follower
    @newsfeed = Newsfeed.find(params.fetch("id_to_remove"))

    @newsfeed.destroy

    redirect_to("/profiles/#{@newsfeed.user_id}", notice: "Newsfeed deleted successfully.")
  end

  def destroy_row
    @newsfeed = Newsfeed.find(params.fetch("id_to_remove"))

    @newsfeed.destroy

    redirect_to("/newsfeeds", :notice => "Newsfeed deleted successfully.")
  end
end
