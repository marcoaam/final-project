class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessor :login #who put it there? I think it is old syntax ... 
  # REEEEADDDDDDDD !!!!! 
  has_many :properties

  has_many :reviews, as: :imageable

  has_many :pictures, as: :imageable, dependent: :destroy

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end
  #Explain me this method guys
end