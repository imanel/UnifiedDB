# This is fix for Ruby 1.8.7 inability to sort symbols

def do_sort(array)
  array.sort { |a, b| a.to_s <=> b.to_s }
end