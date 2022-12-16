# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "date"
class Cat < ApplicationRecord
    CAT_COLOR = ['white', 'black', 'gray', 'orange', 'blue']
    SEX = ['M', 'F', 'f', 'm']
    validates :birth_date, :color, :name, :sex, presence: true
    validate :inclusion, :birth_date_cannot_be_future

    def inclusion 
        if !Cat::CAT_COLOR.include?(color)
            errors.add(:color, "Not possible")
        end

        if !Cat::SEX.include?(sex)
            errors.add(:sex, "Not a real a gender")
        end
    end

    def birth_date_cannot_be_future
        if birth_date.year > Date.today.year
            errors.add(:birth_date, "Not a real date")
        end

        if birth_date.year == Date.today.year
            if birth_date.mon > Date.today.month
                errors.add(:birth_date, "Not a real date")
            end

            if birth_day.mon == Date.today.mon
                if birth_date.day > Date.today.day
                    errors.add(:birth_date, "Not a real date")
                end
            end
        end
    end

    def age
        age = Date.today.year - birth_date.year
    end

    
end
