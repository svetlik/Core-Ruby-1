module GameOfLife
  class Board
    include Enumerable

    def initialize(*living_cells)
      @living_cells = {}
      living_cells.each { |cell| @living_cells[cell] = true }
    end

    def [](x, y)
      @living_cells[[x, y]] == true
    end

    def each
      return to_enum(:each) unless block_given?
      @living_cells.each { |cell| yield cell }
    end

    def count
      @living_cells.count
    end

    def next_generation
      
    end

    def kill(cell)
      @living_cells[cell] = false
    end

    def spawn(cell)
      @living_cells[cell] = true
    end
  end
end
