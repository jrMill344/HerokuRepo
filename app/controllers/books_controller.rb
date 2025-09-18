class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy confirm_delete ]

  # GET /books or /books.json
  # Home Page — list all books
  def index
    @books = Book.all.order(created_at: :desc)
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path, notice: "Book was successfully created."
    else
      flash.now[:alert] = "Unable to create book. Please check the form."
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    if @book.update(book_params)
      redirect_to root_path, notice: "Book was successfully updated."
    else
      flash.now[:alert] = "Unable to update book. Please check the form."
      render :edit, status: :unprocessable_entity
    end
  end

  # GET /books/1/confirm_delete
  def confirm_delete
    # renders confirm_delete.html.erb
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    redirect_to root_path, notice: "Book was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :price, :published_date)
    end
end
