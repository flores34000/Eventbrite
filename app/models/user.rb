class User < ApplicationRecord
    after_create :welcome_send

    has_many :events
    has_many :attendances

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :description, presence: true, length: { in: 6..200 }
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email valide" }


    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
end
