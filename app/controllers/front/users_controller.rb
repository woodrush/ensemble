class Front::UsersController < Front::FrontController
  before_action :find_doctor, only: :show
  before_action :user_params, only: [:create, :update]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path # Sto question path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      redirect_to user_path(current_user) # Sto question path
    else
      render :new
    end
  end

  private
    def user_params
      params[:user].permit(:username, :role_id, :role_type, :email, :password, :password_confirmation)
    end
end
