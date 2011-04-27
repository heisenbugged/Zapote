class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  field :admin, :type => Boolean, :default => false
  field :full_name
  validates_presence_of :full_name
end
