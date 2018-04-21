class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    has_many :user_tours
    has_many :tours, through: :user_tours

    has_many :projetos, dependent: :destroy
    validates :username, 
        presence: true, 
        uniqueness: { case_sensitive: true }, 
        length: { minumum: 3, maximum: 25 }
        
    VALID_EMAIL_REGEX  =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, 
        presence: true, 
        uniqueness: { case_sensitive: true }, 
        length: {  maximum: 105 }, 
        format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end