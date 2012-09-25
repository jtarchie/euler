local math = require("math")
local table = require("table")

module(...)

function upto(n)
  local sieve = { }
  local primes = { }
 
  for i = 2, n, 1 do sieve[i] = true end
  for i = 2, math.sqrt(n), 1 do
    if sieve[i] then
      for j = i * i, n, i do
        sieve[j] = false
      end
    end
  end
  for i = 2, n, 1 do
    if sieve[i] then
      table.insert(primes, i)
    end
  end

  return primes, sieve
end
