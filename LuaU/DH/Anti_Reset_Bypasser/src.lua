-- getgenv().Anti_Reset_Bypasser = true

repeat
    task.wait()
until game:IsLoaded()
local function findService(service)
    return game:FindService(service)
end
findService'Players'.localPlayer.Character:WaitForChild'FULLY_LOADED_CHAR'

local _game = getrawmetatable(game)
setreadonly(_game, false)
local ___namecall = _game.__namecall
_game.__namecall = newcclosure(function(...)
    if getnamecallmethod() == 'FireServer' and ({...})[1].Name == 'MainEvent' and ({...})[2] == 'ResetNew' then
        return
    end
    return ___namecall(...)
end)
setreadonly(_game, true)

local resetBindable = Instance.new('BindableEvent', findService'StarterGui')
resetBindable.Event:connect(function()
    findService'Players'.localPlayer.Character:FindFirstChildWhichIsA'Humanoid':ChangeState'Dead'
end)
while getgenv().Anti_Reset_Bypasser do
    pcall(function()
        findService'StarterGui':SetCore('ResetButtonCallback', resetBindable)
        task.wait()
    end)
end
