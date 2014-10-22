class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :answers
  has_many :votes

  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
