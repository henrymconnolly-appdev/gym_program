class ProfilesController < ApplicationController
  before_action :current_user_must_be_profile_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_profile_user
    profile = Profile.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == profile.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @profiles = Profile.page(params[:page]).per(10)

    render("profile_templates/index.html.erb")
  end

  def show
    @newsfeed = Newsfeed.new
    @profile = Profile.find(params.fetch("id_to_display"))

    render("profile_templates/show.html.erb")
  end

  def new_form
    @profile = Profile.new

    render("profile_templates/new_form.html.erb")
  end

  def create_row
    @profile = Profile.new

    @profile.user_id = params.fetch("user_id")
    @profile.total_lift = params.fetch("total_lift")

    if @profile.valid?
      @profile.save

      redirect_back(:fallback_location => "/profiles", :notice => "Profile created successfully.")
    else
      render("profile_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @profile = Profile.find(params.fetch("prefill_with_id"))

    render("profile_templates/edit_form.html.erb")
  end

  def update_row
    @profile = Profile.find(params.fetch("id_to_modify"))

    
    @profile.total_lift = params.fetch("total_lift")

    if @profile.valid?
      @profile.save

      redirect_to("/profiles/#{@profile.id}", :notice => "Profile updated successfully.")
    else
      render("profile_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @profile = Profile.find(params.fetch("id_to_remove"))

    @profile.destroy

    redirect_to("/profiles", :notice => "Profile deleted successfully.")
  end
end
