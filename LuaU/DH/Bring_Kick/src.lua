--[[repeat
    task.wait()
until game:IsLoaded()
local function findService(service)
    return game:FindService(service)
end
findService'Players'.localPlayer.Character:WaitForChild'FULLY_LOADED_CHAR']]

while getgenv().Bring_Kick do
    local success, error = pcall(function()
        if findService'Players'.localPlayer.Character.BodyEffects.Grabbed.Value ~= nil and findService'Players':FindFirstChild(tostring(findService'Players'.localPlayer.Character.BodyEffects.Grabbed.Value)) then
            findService'Players'.localPlayer.Character.BodyEffects.Grabbed.Value.LeftUpperLeg.Postion = Vector3.new(100, -1200, 100)
            repeat
                task.wait()
            until not findService'Players'.localPlayer.Character.BodyEffects.Grabbed.Value
        end
    end)
    if error then print(error) end
    task.wait()
end
