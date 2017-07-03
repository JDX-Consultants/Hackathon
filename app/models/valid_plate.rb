class ValidPlate < ApplicationRecord

    has_one :valid_plate

    def self.match?(number)
        where('light_plate like ?', "%#{number}%").first
    end

end
