class Event < ApplicationRecord
    has_many :attendances
    belongs_to :user

    validates :start_date, presence: true, 
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
    validates :location, presence: true
  
   
    
end
