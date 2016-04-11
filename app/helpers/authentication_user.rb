module Authentication
  extend ActiveSupport::Concern

  included do
    include Clearance::User
  end

  module ClassMethods
    def from_omniauth(auth)
      @user   = User.find_by(provider: auth.provider, uid: auth.uid)
      @user ||= create_new_user_from_auth(auth)

      @user
    end

    def create_new_user_from_auth(auth)
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider 
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.email = auth.info.email
        user.last_name = auth.info.last_name
      end
    end
  end
end