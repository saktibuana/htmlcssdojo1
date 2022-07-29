exam = {subject: "Math"}

# Add an if statement with condition based on the value of the element with the symbol :score
if exam[:score]
  puts "Your score for #{exam[:subject]} is #{exam[:score]}%"
else
  puts "Your score for #{exam[:subject]} has not been assessed"
end
