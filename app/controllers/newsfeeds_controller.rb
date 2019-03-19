class NewsfeedsController < ApplicationController
  def index
    @newsfeeds = Newsfeed.all

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

  def edit_form
    @newsfeed = Newsfeed.find(params.fetch("prefill_with_id"))

    render("newsfeed_templates/edit_form.html.erb")
  end

  def update_row
    @newsfeed = Newsfeed.find(params.fetch("id_to_modify"))

    @newsfeed.user_id = params.fetch("user_id")
    @newsfeed.profile_id = params.fetch("profile_id")

    if @newsfeed.valid?
      @newsfeed.save

      redirect_to("/newsfeeds/#{@newsfeed.id}", :notice => "Newsfeed updated successfully.")
    else
      render("newsfeed_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @newsfeed = Newsfeed.find(params.fetch("id_to_remove"))

    @newsfeed.destroy

    redirect_to("/newsfeeds", :notice => "Newsfeed deleted successfully.")
  end
end
