class BooksController < ApplicationController
  
  before_action :find_author, only: [:index, :new, :create]
  before_action :find_book, only: [:show, :edit, :update, :destroy] 

  def index
  	
  end
  def new
  	@book = Book.new
  end
  def edit
  	
  end
  def show
  end
  def create
  	@book = Book.new(book_params)
  	@author.books << @book
  	@book.save
  	redirect_to authors_path
  end
  def update
  	@book.update(book_params)
  	redirect_to authors_path
  end
  def destroy
  	@book.destroy
  	redirect_to authors_path
  end

  private
    def find_book
      @book = Book.find params[:id]
    end
    def find_author
      @author = Author.find params[:author_id]
    end
    def book_params
      params.require(:book).permit(:title, :description, :cover)
    end	
  	
end
