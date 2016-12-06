class User < ApplicationRecord


  validates :name,presence: true,length: {maximum: 50}
  validates :email,presence: true,length: {maximum: 254},
            uniqueness: {case_sensitive: false},
            format:{with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password,presence: true,length: {minimum: 6}


  before_save {email.downcase!}


  has_secure_password
  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
          BCrypt::Engine.cost
      BCrypt::Password.create(string,cost: cost)
    end
  end

end
