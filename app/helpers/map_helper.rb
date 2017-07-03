module MapHelper

    def pos_x(left, right, position)
        ((position - left) / (right - left)) * 1200
    end

    def pos_y(top, bottom, position)
        ((position - bottom) / (top - bottom)) * 766
    end

end
