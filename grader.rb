def grader(score)
  if score=>0.6 && score<0.7 return "D"
  elseif score=>0.7 return "C"
  end
  		
end

put grader (0.66)