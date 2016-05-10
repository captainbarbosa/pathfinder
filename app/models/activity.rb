class Activity < ActiveRecord::Base
  belongs_to :trip

  validates :trip_id, :name, :date, presence: true
end
