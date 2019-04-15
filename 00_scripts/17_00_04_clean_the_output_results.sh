# Clean the output results from the glm
# Delete the double spaces
sed -e 's/\ \ //g' /Users/pierre-louisstenger/Desktop/test.txt > /Users/pierre-louisstenger/Desktop/test2.txt

# Delete return to the line
tr -d '\n' < /Users/pierre-louisstenger/Desktop/test2.txt > /Users/pierre-louisstenger/Desktop/test3.txt

# Create return to the line if "scaffold" pattern
sed $'s/scaffold/\\\nscaffold/g' /Users/pierre-louisstenger/Desktop/test3.txt > /Users/pierre-louisstenger/Desktop/test4.txt


