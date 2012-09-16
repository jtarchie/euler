s = ""
for i = 1, 200000, 1 do
  s = s .. tostring(i)
end

sum = 1
for i = 0, 6, 1 do
  value = string.sub(s, 10 ^ i, 10 ^ i)
  sum = sum * value
end

print(sum)
