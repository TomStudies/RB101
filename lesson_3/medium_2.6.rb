def color_valid(color)
  (color == blue || green) ? true : false # This is not what they were looking for, and as far as I understand only simplifies things visually.
end
# Their solution was simply a color == "blue" || color == "green". Since the method returns the last statement result it will return true or false regardless.