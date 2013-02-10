# From the TangoSource's code retreat at February 9th, and mixing the approach from @antillas21
require 'pry'

class World
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def draw
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
end
