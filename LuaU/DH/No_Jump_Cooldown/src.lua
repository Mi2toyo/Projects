repeat
    task.wait()
until game:IsLoaded()
local function findService(service)
    return game:FindService(service)
end
findService'Players'.localPlayer.Character:WaitForChild'FULLY_LOADED_CHAR'

for _, connection in pairs(getconnections(findService'Players'.localPlayer.Character:FindFirstChildWhichIsA'Humanoid'.Jumping)) do
    if getinfo(connection).name == '' then
        if getgenv().No_Jump_Cooldown then
            connection:Disable()
        else
            connection:Enable()
        end
    end
end
