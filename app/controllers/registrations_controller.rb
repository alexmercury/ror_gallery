class RegistrationsController <  Devise::RegistrationsController

  def new
    super
  end

  def create
    @user = User.new(params[:user])
    if simple_captcha_valid?
      if @user.save
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success) if is_navigational_format?
      else
        render action: :new
      end
    else
      @user.valid_with_captcha?
      render action: :new
    end
  end

  def update
      if current_user.update_attributes(params[:user])
        set_flash_message :notice, :updated
        sign_in @user, bypass: true
        redirect_to after_update_path_for(@user)
      else
        render action: :edit
      end
  end

end