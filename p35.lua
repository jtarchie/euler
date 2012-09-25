local primes = require("primes")
local enum = require("enum")

function rotations(s)
  values = { }
  table.insert(values, s)
  for i = 2, string.len(s), 1 do
    s = string.sub(s, 2) .. string.sub(s, 1, 1)
    table.insert(values, s)
  end
  return values
end

all_primes, sieve = primes.upto(1000000)

circular_primes = enum.detect(all_primes, function(prime)
  return not enum.any(rotations(tostring(prime)), function(s)
    return not sieve[tonumber(s)]
  end)
end)

print(enum.length(circular_primes))
