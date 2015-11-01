class User < ActiveRecord::Base
  validated :username, :email, :password, presence: true 
end
