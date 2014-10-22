class Vote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user

  validates :user, presence: true
  validates :value, presence: true
  validates :answer, presence: true


end
