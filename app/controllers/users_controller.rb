class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dbs
    # Rails.application.eager_load! # To load all models app/models/**/*.rb
    # all_records = ActiveRecord::Base.descendants.map &:all
    # all_records.to_json

    # render json: all_records

    @users = User.all
    @posts = Post.all
    @comments = Comment.all
    @albums = Album.all
    @photos = Photo.all

    @photos.each do |p|
      p['url'] = p['url'].gsub('"', '')
      p['thumbnailurl'] = p['thumbnailurl'].gsub('"', '')

    end

    # puts @photos[3]['url']
    # puts @photos[3]['url'].gsub('"', '\'')
    # users = User.all.to_json
    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render json: {users: @users,posts: @posts,comments: @comments,albums: @albums,photos: @photos }, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :pass, :address, :city, :phone, :website, :company)
    end
end
