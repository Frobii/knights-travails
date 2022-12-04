class GameBoard

    attr_reader :grid
    attr_writer :grid

    def initialize
        @board = Array.new(64){Array.new(2, 0)}
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
        row1,row2,row3,row4,row5,row6,row7,row8 = Array.new(8) {[]}

        array.each do |row|
            if row[0] == 0
                row1.push(row)
            elsif row[0] == 1
                row2.push(row)
            elsif row[0] == 2
                row3.push(row)
            elsif row[0] == 3
                row4.push(row)
            elsif row[0] == 4
                row5.push(row)
            elsif row[0] == 5
                row6.push(row)
            elsif row[0] == 6
                row7.push(row)
            elsif row[0] == 7
                row8.push(row)
            end
        end

        p row1,row2,row3,row4,row5,row6,row7,row8
    end

end

a = GameBoard.new

a.gridify

a.display_board
