fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish(fish)
  fish.each_with_index do |el1, i|
    max = true
    fish.each_with_index do |el2, j|
      next if i == j
      max = false if el2.length > el1.length
    end
    return el1 if max
  end
end

def dominant(fish, &prc)
  prc ||= Proc.new { |x, y| x <=> y }
  mid = fish.length / 2
  return fish if fish.length <= 1
  left = dominant(fish[0...mid], &prc)
  right = dominant(fish[mid + 1..-1], &prc)
  merge(left, right, &prc)
end

def merge(left, right, &prc)
  merged = []
  until left.empty? || right.empty?
    case prc.call(left[0], right[0])
    when -1
      merged << left.pop
    when 0
      merged << right.pop
    when 1
      merged << right.pop
    end
  end
  merged + left + right
end

def clever(fish)
  max_length = 0
  longest = fish.first
  fish.each do |el|
    if el.length > max_length
      max_length = el.length
      longest = el
    end
  end
  longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
