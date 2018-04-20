class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map << [key, value] if @map.empty?
    @map.each do |el|
      if el[0] == key
        @map.delete(el)
        @map << [key, value]
      else
        @map << [key, value]
      end
    end
  end

  def lookup(key)
    @map.each do |el|
      if el[0] == key
        return el
      else
        return nil
      end
    end
  end

  def remove(key)
    @map.each do |el|
      if el[0] == key
        @map.delete(el)
      end
    end
  end

  def show
    @map
  end
end
