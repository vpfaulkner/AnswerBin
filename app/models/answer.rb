class Answer < ActiveRecord::Base
  has_many :votes
  belongs_to :question
  belongs_to :user

  validates :text, presence: true
  validates :user, presence: true
  validates :question, presence: true

  def score
    votes.sum(:value)
  end

end
