class Activity < ActiveRecord::Base
  belongs_to :trip

  validates :name, :date, presence: true
end
