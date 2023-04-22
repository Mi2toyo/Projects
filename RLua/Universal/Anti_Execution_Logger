local _game = getrawmetatable(game)
setreadonly(_game, false)
local ___namecall = _game.__namecall
_game.__namecall = newcclosure(function(...)
    if getnamecallmethod():lower():find'httpget' and ({...})[2]:find'.php' then
        return
    end
    return ___namecall(...)
end)
setreadonly(_game, true)
setreadonly(syn, false)
syn.request = newcclosure(function()
    return
end)
setreadonly(syn, true)
