class AdminController < ApplicationController
  def index
    @users = User.all
  end

  def update
    seen_user_ids     = params["seen_users"].map(&:to_i)
    approved_user_ids = params["approved_users"].map(&:to_i)
    seen_user_ids.each do |user_id|
      approved = approved_user_ids.include?(user_id)
      User.find(user_id).update_attributes(approved: approved)
    end
    redirect_to "/users/admin"
  end
end
