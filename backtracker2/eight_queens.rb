class Game

  def solution
    @queens = []
    r = 7
    search(r)
    @queens
  end

  def search(r)
    if r == 0
      return
    else
      7.times do |i|
        @queens << [r, i]
        if in_check? == false
          break # not return, right?
        else
          @queens.pop
        end
      end
      search(r -= 1)
    end
  end

  def in_check?
    sums = []
    @queens.each do |pos|
      sums << pos[1]
    end
    if sums.length != sums.uniq.length
      return true
    end

    sums = []
    @queens.each do |pos|
      sums << (pos[0] + pos[1])
    end
    if sums.length != sums.uniq.length
      return true
    end

    sums = []
    @queens.each do |pos|
      sums << (pos[0] - pos[1])
    end
    if sums.length != sums.uniq.length
      return true
    end
    false
  end
end

game = Game.new
print game.solution