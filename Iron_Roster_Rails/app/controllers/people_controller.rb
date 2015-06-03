class PeopleController < ApplicationController
  
  def index
  	@people = Person.all
  end

  def show
  	@person = Person.find(params[:id])
  end

  def edit
  	@person = Person.find(params[:id])
  end

  def update
  	@person = Person.find(params[:id])

  	if @person.update(params.require(:person).permit(:name, :subject, :github_account))
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def new
  	@person = Person.new
  end

  def create
	@person = Person.new(params.require(:person).permit(:name, :subject, :github_account))
	if @person.save
		redirect_to root_path 		
	else
		render 'new'
	end
  end

 
end
