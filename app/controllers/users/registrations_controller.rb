# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(customization_sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @residence = @user.build_residence
    render :new_residence
  end

  def create_residence
    @user = User.new(session["devise.regist_data"]["user"])
    @residence = Residence.new(residence_params)
    unless @residence.valid?
      flash.now[:arert] = @residence.errors.full_messages
      render :new_residence and return
    end
    @user.build_residence(@residence.attributes)
    @user.save
    sign_in(:user, @user)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    
  end

  def customization_sign_up_params
    date = params[:birth_date]
    if date["birth_date(1i)"].empty? or date["birth_date(2i)"].empty? or date["birth_date(3i)"].empty?
      sign_up_params.merge(birth_date: nil)
    else
      birth_date_params = Date.new(date["birth_date(1i)"]&.to_i, date["birth_date(2i)"]&.to_i, date["birth_date(3i)"]&.to_i)
      sign_up_params.merge(birth_date: birth_date_params)
    end
  end
  def residence_params
    params.require(:residence).permit(:destination_last_name, :destination_name, :destination_last_name_rubi, 
                                      :destination_name_rubi, :postal_code, :prefectures, 
                                      :municipality, :address, :apartment, :phone_number)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
