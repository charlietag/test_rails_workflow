class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :state_change]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end
  
  # PATCH/PUT /books/1/state_change
  def state_change
    @books = Book.all
    book_event = params[:event]
    #if @book.send "may_#{book_event}?".to_sym
    #  @book.send "#{book_event}!".to_sym
    #end
    #render :index

    #---------try aasm method-------
    #return render plain: @book.inspect
    #@book.review!
    #return render plain: @book.aasm.events(permitted: true).map(&:name).join.inspect
    #return render plain: params[:event]
    #book_event = @book.aasm.events(permitted: true).map(&:name).join
    #return render plain: "@book.#{book_event}!"
    #eval "@book.#{book_event}!"
    #@book.send "#{book_event}!".to_sym
    #---------try aasm method-------
    
    respond_to do |format|
      #if eval "@book.#{book_event}!"
      if @book.send "can_#{book_event}?".to_sym
        #eval "@book.#{book_event}!"
        @book.send "#{book_event}!".to_sym
        format.html { redirect_to books_path, notice: 'State of Book was successfully changed.' }
        format.js
        #format.json { render :show, status: :created, location: @book }
      else
        format.html { redirect_to books_path, notice: 'State of Book : Failed to change.' }
        #format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :author)
    end
end
