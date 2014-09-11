class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessor :login

  has_many :properties

  has_many :reviews, as: :imageable

  has_many :pictures, as: :imageable, dependent: :destroy

  validates_each :pictures do |user, attr, value|
    user.errors.add attr, "too much pictures for user" if user.pictures.size > 1
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

end