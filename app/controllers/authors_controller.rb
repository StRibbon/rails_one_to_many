class AuthorsController < ApplicationController

  before_action :author_find, only: [:show, :edit, :update, :destroy]
  
  def index
	@authors = Author.all
	render :index
  end

  def new
  	@author = Author.new
  end

  def show

  end

  def edit

  end

  def create
  	@author = Author.new(author_params)
  	@author.save
  	redirect_to authors_path
  end

  def update
  end

  def destroy
  end

  private
  	def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
    def author_find
      @author = Author.find(params[:id])
    end
end
