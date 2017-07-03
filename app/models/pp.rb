class PP < ApplicationRecord

    def self.highest_position
        if all.count == 0
            0
        else
            maximum(:pos).to_i
        end
    end


end
