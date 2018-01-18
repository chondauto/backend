class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        respond_to do |format|
            if @book.save
                format.html{redirect_to @book}
                format.json{render :show, location: @student}
            else
                render :new
            end
        end
    end

    def edit
    end

    def show
    end

    def update
        respond_to do |format|
            if @book.update(book_params)
                format.html{redirect_to @book}
                format.json{render :show, location: @student}
            else
                render :edit
            end
        end
    end

    def destroy
        @book.destroy
        redirect_to books_url
    end

    private
    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit :title, :content, :author
    end
end
