def sum(*numbers)
  numbers.reject! {|number| number.is_a?(Integer) != true}
  numbers.inject(0) {|sum, number| sum + number }
end
