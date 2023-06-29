# Ask the user for the length of the rectangle
print "Enter the length of the rectangle: "
length = gets.chomp.to_f

# Ask the user for the width of the rectangle
print "Enter the width of the rectangle: "
width = gets.chomp.to_f

# Calculate the area of the rectangle
area = length * width

# Display the area
puts "The area of the rectangle is #{area}."