local g = getmetatable(_G)
g.__index = g

g.__newindex = nil
