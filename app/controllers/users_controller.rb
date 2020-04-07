class UsersController < ApplicationController
  before_action :set_card, only: [:show, :logout, :credit]
  def show
  end

  def logout
  end

  def credit
  end
  
  private
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end
