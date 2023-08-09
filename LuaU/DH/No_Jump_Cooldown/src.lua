-- getgenv().No_Jump_Cooldown = true

for _, connection in pairs(getconnections(game:FindService'Players'.localPlayer.Character:FindFirstChildWhichIsA'Humanoid'.Jumping)) do
    if getinfo(connection).name == '' then
        connection:Disable()
    end
end