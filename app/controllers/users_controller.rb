class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # POST /users/login
  def login
    user = params[:user]
    password = params[:password]
    user = User.where(:user => user, :password => password)[0]
    user.count = user.count + 1
    user.save
    render :json => {:count => user.count}
  end

  # POST /users/add
  def add
    user = params[:user]
    password = params[:password]
    user = User.new(:user => user, :password => password, :count => 1)
    user.save
    # User.create(:user => user, :password => password, :count => 0)
    render :json => {:user => user.user, :password => user.password}
  end

  # POST /TESTAPI/resetFixture
  def TESTAPI_resetFixture
    User.all.map(&:destroy)
    render :json => {}
  end

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
    @user.count = 1
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
  # def create
  #   @user = User.new(params[:user])
  #   if @user.save
  #     redirect_to root_url, :notice => "Signed up!"
  #   else
  #     render "new"
  #   end
  # end

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user, :password, :count)
    end
end
