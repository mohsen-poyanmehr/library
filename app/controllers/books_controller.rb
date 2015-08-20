class BooksController < ApplicationController
  def index
#    @books = Book.all
	@books =Book.page(params[:page]).per(10)
    @categories = Category.all
  end

  def create
    Book.create title: params[:title], category_id: params[:category_id]
    redirect_to "/books"
  end

  def show
    @book  = Book.find(params[:id])
    @comments = @book.comments.page(params[:page]).per(3) 
  end

  def update
   @book =  Book.find(params[:id])
	if @book.update title: params[:title]
		redirect_to "/books/#{params[:id]}"
	else
		render "show"
	end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to "/books"
  end

  def comment
	Comment.create content: params[:content], author: params[:author], book_id: params[:id]
	redirect_to "/books/#{params[:id]}"
  end
end
