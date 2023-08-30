repeat
    task.wait()
until game:IsLoaded()
local function findService(service)
    return game:FindService(service)
end
findService'Players'.localPlayer.Character:WaitForChild'FULLY_LOADED_CHAR'
local function notify(title, txt)
    findService'StarterGui':SetCore('SendNotification', {Title = title, Text = txt})
end

if getgenv().Reset_Plus then
    if not getgenv().Reset_Plus_Executed then
        local start = tick()
        getgenv().Reset_Plus_Executed = true
        local _; _ = hookmetamethod(game, '__namecall', newcclosure(function(...)
            if getnamecallmethod() == 'FireServer' and ({...})[1].Name == 'MainEvent' and ({...})[2] == 'ResetNew' then
                if getgenv().Reset_Plus then
                    return
                end
            end
            return _(...)
        end))
        local resetBindable = findService'StarterGui':FindFirstChildWhichIsA'BindableEvent'
        if resetBindable == nil then
            resetBindable = Instance.new('BindableEvent', findService'StarterGui')
            resetBindable.Event:connect(function()
                findService'Players'.localPlayer.Character:FindFirstChildWhichIsA'Humanoid':ChangeState'Dead'
            end)
        else
            resetBindable.Event:connect(function()
                findService'Players'.localPlayer.Character:FindFirstChildWhichIsA'Humanoid':ChangeState'Dead'
            end)
        end
        coroutine.wrap(function()
            while getgenv().Reset_Plus do
                pcall(function()
                    findService'StarterGui':SetCore('ResetButtonCallback', resetBindable)
                    task.wait()
                end)
            end
        end)()
        notify('Reset+', 'script loaded in '..(tick() - start)..' seconds')
    else
        notify('Reset+', 'Script is already executed!')
    end
else
    if getgenv().Reset_Plus_Executed then
        local start = tick()
        getgenv().Reset_Plus, getgenv().Reset_Plus_Executed = false, false
        findService'StarterGui':FindFirstChildWhichIsA'BindableEvent'.Event:connect(function()
            findSerivce'ReplicatedStorage'.MainEvent:FireServer'ResetNew'
        end)
        notify('Reset+', 'script uloaded in '..(tick() - start)..' seconds')
    else
        notify('Reset+', 'Script is not executed!')
    end
end