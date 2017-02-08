class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render("index.html.erb")
  end

  def show
    @director = Director.find(params[:id])
    render("show.html.erb")
  end

  def new_form
    render("new_form.html.erb")
  end

  def create_row
    d = Director.new
    d.dob = params[:dob]
    d.name = params[:name]
    d.bio = params[:bio]
    d.image_url = params[:image_url]

    d.save

    redirect_to("http://localhost:3000/directors/#{params[:id]}")
  end

  def edit_form
    @director = Director.find(params[:id])
    render("edit_form.html.erb")
  end

  def update_row
    director = Director.find(params[:id])

    director.dob = params[:the_dob]
    director.name = params[:the_name]
    director.bio = params[:the_bio]
    director.image_url = params[:the_image_url]

    director.save

    redirect_to("http://localhost:3000/directors/#{params[:id]}")
  end

  def destroy
    @director = Director.find(params[:id])
    @director.name = params[:name]

    @director.destroy
    render("destroy.html.erb")
  end
end
