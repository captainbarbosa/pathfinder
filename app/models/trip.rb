class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :name, presence: true
end
