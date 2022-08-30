class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:alret] = "Failed to post."
      @books = Book.all
      render :index
    end
  end


  def index
    @books = Book.all
    @book = Book.new
    flash[:notice] = "Book was successfully created."
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:update] = "Book was successfully updated."
       redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
       flash[:destroy] = "Book was successfully destroyed."
       redirect_to '/books'
   end
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
