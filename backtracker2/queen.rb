class Queen
  attr_accessor :r, :c, :unicode

  def initialize(r, c)
    @r = r
    @c = c
    @unicode = "\u265B"
  end

  def in_check?(queens)
    sums = []
    queens.each do |q|
      sums << q.c
    end
    if sums.length != sums.uniq.length
      return true
    end

    sums = []
    queens.each do |q|
      sums << (q.r + q.c)
    end
    if sums.length != sums.uniq.length
      return true
    end

    sums = []
    queens.each do |q|
      sums << (q.r - q.c)
    end
    if sums.length != sums.uniq.length
      return true
    end
  end
end