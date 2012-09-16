local math = require("math")

function is_prime(number)
  if number < 2 then
    return false
  end
  for i = 2, math.sqrt(number) do
	  if number % i == 0 then
  		return false
  	end
  end
  return true
end

function from_all(num)
  s = string.format("%d", num)

  list = { }
  for i = 1, string.len(s), 1 do
    table.insert( list, tonumber(string.sub(s, 1, i)) )
    table.insert( list, tonumber(string.sub(s, i, string.len(s))))
  end
  return list
end

function truncatable(num)
  numbers = from_all(num)
  for i, v in pairs(numbers) do
    if not is_prime(v) then
      return false
    end
  end
  return true
end

max_num = 1000000 
numbers = { }

for i = 10, max_num, 1 do
  if is_prime(i) and truncatable(i) then
    print(i)
    table.insert( numbers, i )
    if table.maxn(numbers) > 20 then
      break
    end
  end
end
