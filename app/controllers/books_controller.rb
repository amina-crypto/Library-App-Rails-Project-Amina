class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:reserve]
  before_action :set_book, only: [:show, :reserve]

  def index
    @books = Book.all
    @books = @books.search(params[:search]) if params[:search].present?
    @books = @books.by_category(params[:category]) if params[:category].present?
    @current_category = params[:category]
    @query = params[:search]

    respond_to do |format|
      format.html # renders the default HTML view
      format.json { render json: @books }
      format.xml  { render xml: @books }
    end
  end

  def show
    respond_to do |format|
      format.html # renders the default HTML view
      format.json { render json: @book }
      format.xml  { render xml: @book }
    end
  end

  def reserve
    @book.reservation.destroy if @book.reservation&.reservation_expired?
    if @book.available? && current_user.reservations.create(book: @book, expires_at: 2.hours.from_now, status: 'pending')
      respond_to do |format|
        format.html { redirect_to books_path, notice: "Book reserved successfully" }
        format.json { render json: @book, status: :created }
        format.xml  { render xml: @book, status: :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to books_path, alert: "Failed to reserve book" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
        format.xml  { render xml: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
