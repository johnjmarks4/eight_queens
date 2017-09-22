class Game

  def solution
    @queens = []
    r = 7
    init = 0
    while @queens.length < 7
      search(r, init)
      init += 1
    end
    @queens
  end

  def search(r, init)
    if r == 0
      return
    else
      (init..7).to_a.each do |i|
        @queens << [r, i]
        if in_check? == false
          break # not return, right?
        else
          @queens.pop
        end
      end
      if r < 7 then init = 0 end
      search(r -= 1, init)
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