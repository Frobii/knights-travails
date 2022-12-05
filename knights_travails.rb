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

class Knight_Node

    attr_reader :coordinate, :vert1, :vert2, :vert3, :vert4, :vert5, :vert6, :vert7, :vert8
    attr_writer :coordinate, :vert1, :vert2, :vert3, :vert4, :vert5, :vert6, :vert7, :vert8

    def initialize(value)
        @coordinate = value
        @vert1 = nil
        @vert2 = nil
        @vert3 = nil
        @vert4 = nil
        @vert5 = nil
        @vert6 = nil
        @vert7 = nil
        @vert8 = nil
    end

end

class Knight < GameBoard

    def possible_moves(board = @board)
        board.each do |coord|
            move = Knight_Node.new(coord)

            vert1 = [coord[0] + 1, coord[1] + 2]
            vert2 = [coord[0] + 2, coord[1] + 1]
            vert3 = [coord[0] - 1, coord[1] + 2]
            vert4 = [coord[0] - 2, coord[1] + 1]
            vert5 = [coord[0] - 1, coord[1] - 2]
            vert6 = [coord[0] - 2, coord[1] - 1]
            vert7 = [coord[0] + 1, coord[1] - 2]
            vert8 = [coord[0] + 2, coord[1] - 1]

            if vert1[0] >= 0 && vert1[1] >= 0 && vert1[0] <= 7 && vert1[1] <= 7
                move.vert1 = vert1
            end

            if vert2[0] >= 0 && vert2[1] >= 0 && vert2[0] <= 7 && vert2[1] <= 7
                move.vert2 = vert2
            end

            if vert3[0] >= 0 && vert3[1] >= 0 && vert3[0] <= 7 && vert3[1] <= 7
                move.vert3 = vert3
            end

            if vert4[0] >= 0 && vert4[1] >= 0 && vert4[0] <= 7 && vert4[1] <= 7
                move.vert4 = vert4
            end

            if vert5[0] >= 0 && vert5[1] >= 0 && vert5[0] <= 7 && vert5[1] <= 7
                move.vert5 = vert5
            end

            if vert6[0] >= 0 && vert6[1] >= 0 && vert6[0] <= 7 && vert6[1] <= 7
                move.vert6 = vert6
            end

            if vert7[0] >= 0 && vert7[1] >= 0 && vert7[0] <= 7 && vert7[1] <= 7
                move.vert7 = vert7
            end

            if vert8[0] >= 0 && vert8[1] >= 0 && vert8[0] <= 7 && vert8[1] <= 7
                move.vert8 = vert8
            end

        end
    end
end

a = Knight.new

a.gridify

a.display_board

a.possible_moves
