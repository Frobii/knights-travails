class GameBoard

    attr_reader :grid
    attr_writer :grid

    def initialize
        # call a new Knight_Node object so I can link the possible nodes together
        @board = Array.new(64){Knight_Node.new}
    end

    def gridify(array = @board)
        i = 0
        j = 0
    
        array.each do |row|
            if i == 8
                i = 0
                j += 1
            end

            # specifies the coordinate attribute of our Knight_Node object
            row.coordinate[1] += i
            row.coordinate[0] += j

            i += 1
        end
    end

    def display_board(array = @board)
        row1,row2,row3,row4,row5,row6,row7,row8 = Array.new(8) {[]}

        array.each do |row|
            if row.coordinate[0] == 0
                row1.push(row.coordinate)
            elsif row.coordinate[0] == 1
                row2.push(row.coordinate)
            elsif row.coordinate[0] == 2
                row3.push(row.coordinate)
            elsif row.coordinate[0] == 3
                row4.push(row.coordinate)
            elsif row.coordinate[0] == 4
                row5.push(row.coordinate)
            elsif row.coordinate[0] == 5
                row6.push(row.coordinate)
            elsif row.coordinate[0] == 6
                row7.push(row.coordinate)
            elsif row.coordinate[0] == 7
                row8.push(row.coordinate)
            end
        end

        p row1,row2,row3,row4,row5,row6,row7,row8
    end
    
end

class Knight_Node

    attr_reader :coordinate, :vert1, :vert2, :vert3, :vert4, :vert5, :vert6, :vert7, :vert8, :visited
    attr_writer :coordinate, :vert1, :vert2, :vert3, :vert4, :vert5, :vert6, :vert7, :vert8, :visited

    def initialize(value = [0, 0])
        @coordinate = value
        @visited = false
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

    def get_index(coord, board = @board)
        coordArray = []

        board.each do |node|
            coordArray.push(node.coordinate)
        end 
        
        return coordArray.index(coord)
    end

    def possible_nodes(board = @board)
        coordArray = []

        board.each do |node|
            coordArray.push(node.coordinate)
        end

        board.each do |node|

            vert1 = [node.coordinate[0] + 1, node.coordinate[1] + 2]
            vert2 = [node.coordinate[0] + 2, node.coordinate[1] + 1]
            vert3 = [node.coordinate[0] - 1, node.coordinate[1] + 2]
            vert4 = [node.coordinate[0] - 2, node.coordinate[1] + 1]
            vert5 = [node.coordinate[0] - 1, node.coordinate[1] - 2]
            vert6 = [node.coordinate[0] - 2, node.coordinate[1] - 1]
            vert7 = [node.coordinate[0] + 1, node.coordinate[1] - 2]
            vert8 = [node.coordinate[0] + 2, node.coordinate[1] - 1]

            if vert1[0] >= 0 && vert1[1] >= 0 && vert1[0] <= 7 && vert1[1] <= 7
                index = coordArray.index(vert1)
                node.vert1 = board[index]
            end

            if vert2[0] >= 0 && vert2[1] >= 0 && vert2[0] <= 7 && vert2[1] <= 7
                index = coordArray.index(vert2)
                node.vert2 = board[index]
            end

            if vert3[0] >= 0 && vert3[1] >= 0 && vert3[0] <= 7 && vert3[1] <= 7
                index = coordArray.index(vert3)
                node.vert3 = board[index]
            end

            if vert4[0] >= 0 && vert4[1] >= 0 && vert4[0] <= 7 && vert4[1] <= 7
                index = coordArray.index(vert4)
                node.vert4 = board[index]
            end

            if vert5[0] >= 0 && vert5[1] >= 0 && vert5[0] <= 7 && vert5[1] <= 7
                index = coordArray.index(vert5)
                node.vert5 = board[index]
            end

            if vert6[0] >= 0 && vert6[1] >= 0 && vert6[0] <= 7 && vert6[1] <= 7
                index = coordArray.index(vert6)
                node.vert6 = board[index]
            end

            if vert7[0] >= 0 && vert7[1] >= 0 && vert7[0] <= 7 && vert7[1] <= 7
                index = coordArray.index(vert7)
                node.vert7 = board[index]
            end

            if vert8[0] >= 0 && vert8[1] >= 0 && vert8[0] <= 7 && vert8[1] <= 7
                index = coordArray.index(vert8)
                node.vert8 = board[index]
            end

        end
    end
    
    def knight_moves(start, finish, board = @board)

        currentNode = board[get_index(start)]
    
        queue = [currentNode]
        output = []
        moves = 0

        until output[-1] == finish
            current = queue.shift
            moves += 1
            moves = 0 if current == start
            output.push(current.coordinate)
            queue.push(current.vert1) if current.vert1 && !current.vert1.visited
            current.vert1.visited = true if current.vert1 && current != start
            queue.push(current.vert2) if current.vert2 && !current.vert2.visited
            current.vert2.visited = true if current.vert2 && current != start
            queue.push(current.vert3) if current.vert3 && !current.vert3.visited
            current.vert3.visited = true if current.vert3 && current != start
            queue.push(current.vert4) if current.vert4 && !current.vert4.visited
            current.vert4.visited = true if current.vert4 && current != start
            queue.push(current.vert5) if current.vert5 && !current.vert5.visited
            current.vert5.visited = true if current.vert5 && current != start
            queue.push(current.vert6) if current.vert6 && !current.vert6.visited
            current.vert6.visited = true if current.vert6 && current != start
            queue.push(current.vert7) if current.vert7 && !current.vert7.visited
            current.vert7.visited = true if current.vert7 && current != start
            queue.push(current.vert8) if current.vert8 && !current.vert8.visited
            current.vert8.visited = true if current.vert8 && current != start
        end

        p moves

        output
    end

    def print_paths(node = @board[56])
        # for debugging, change @board[] to check which moves the knight can make
        # remember that the first position of an array is 0 ;)

        p "coordinate"
        p node.coordinate
        p "vert1"
        p node.vert1.coordinate if !node.vert1.nil?
        p "vert2"
        p node.vert2.coordinate if !node.vert2.nil?
        p "vert3"
        p node.vert3.coordinate if !node.vert3.nil?
        p "vert4"
        p node.vert4.coordinate if !node.vert4.nil?
        p "vert5"
        p node.vert5.coordinate if !node.vert5.nil?
        p "vert6"
        p node.vert6.coordinate if !node.vert6.nil?
        p "vert7"
        p node.vert7.coordinate if !node.vert7.nil?
        p "vert8"
        p node.vert8.coordinate if !node.vert8.nil?
        
    end

end
