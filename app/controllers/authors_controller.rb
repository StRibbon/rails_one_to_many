class AuthorsController < ApplicationController

  before_action :find_author, only: [:show, :edit, :update, :destroy]
  # after_action :author_redirect, only: [:create, :update, :destroy]
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
  	@author.update(author_params)
  	@author.save
  	redirect_to authors_path
  end

  def destroy
  	@author.destroy
  	redirect_to authors_path
  end

  private
  	def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
    def find_author
      @author = Author.find(params[:id])
    end
    # def author_redirect
    # 	redirect_to authors_path
    # end
end
