class GameBoard

    attr_reader :grid
    attr_writer :grid

    def initialize
        @board = gridify(Array.new(64){Array.new(2, 0)})
    end

    def gridify(array = @board)
        i = 0
        j = 0
    
        array.each do |row|
            if i == 8
                i = 0
                j += 1
            end

            row[1] += i
            row[0] += j

            i += 1
        end
    end

    def display_board(array = @board)

    end

end

a = GameBoard.new

a.gridify