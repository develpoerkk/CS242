local function add_n(t, n)
  local t_new = {}
  for i = 1, #t do
    t_new[i] = t[i] + n
  end
  return t_new
end

local function add_n_inplace(t, n)
  for i = 1, #t do
    t[i] = t[i] + n
  end
end

local function reverse(t)
  local n = #t
  for i = 1, n/2 do
    local x = t[i]
    t[i] = t[n-i+1]
    t[n-i+1] = x
  end
end

local t = {1, 2, 3, 4, 5, 6, 7, 8, 9}
add_n_inplace(t, 1)
reverse(t)
assert(t[1] == 10)
