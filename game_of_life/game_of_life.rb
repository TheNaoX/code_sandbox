# From the TangoSource's code retreat at February 9th, and mixing the approach from @antillas21
require 'pry'

class Array
  def to_s
    array_string = ""
    self.each do |item|
      array_string += " #{item.to_symbol} "
    end
    array_string
  end
end

class World
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def draw_grid
    header
    @grid.map_cells
  end

  def header
    (0..@grid.size).to_a.each { |i| print " #{i} " }; print "\n"
  end
end

class Grid
  attr_accessor :cells, :size

  # This receives a number of the NxN grid spaces, you have to set 3 for a 3x3 grid size
  def initialize(size)
    @cells = []
    @size = size - 1
    (0..@size).each_with_index do |item, index_x|
      (0..@size).to_a.each_with_index { |item,index_y| @cells << Cell.new({x: index_x, y: index_y}) }
    end
  end

  # I'm going to seed the 30% of the grid with cells, just because yes, I'll have a better answer soon :)
  def seed_cells
    total_cells = (@size + 1) ** 2
    (total_cells * 0.3 ).to_i.times do
      x, y = rand(0..@size), rand(0..@size)
      @cells.select { |cell| cell.coordinates[:x] == x and cell.coordinates[:y] == y }.shift.revive!
    end
  end

  def map_cells
    (0..@size).each do |index|
      puts "#{@cells.select { |cell| cell.coordinates[:x] == index }.to_s}"
    end
  end

  def neighbors?(cell)
    live_neighbors = map_neighbors(cell)
    live_neighbors.delete(nil)
    live_neighbors.count
  end

  def map_neighbors(cell)
    neighbors = []
    for i in -1..1
      for j in -1..1
        neighbors << @cells.select do |neighbor| 
          unless i == 0 and j == 0
            neighbor.coordinates[:x] == cell.coordinates[:x] + i and neighbor.coordinates[:y] == cell.coordinates[:y] + j 
          end
        end.shift
      end
    end
    neighbors.delete(nil)
    neighbors.map { |neighbor| neighbor if neighbor.alive? }
  end
end

class Cell
  attr_accessor :coordinates, :status

  def initialize(coordinates)
    @status = false
    @coordinates = coordinates
  end

  def alive?
    @status == true ? true : false
  end

  def revive!
    @status = true
  end

  def to_symbol
    alive? ? "*" : " "
  end
end

binding.pry
