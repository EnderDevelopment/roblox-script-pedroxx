-- KeyPressPartCreator.server.lua

local Players = game:GetService("Players")

local function onKeyPress(player, key)
    if key == "e" then
        local part = Instance.new("Part")
        part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 0, -5)
        part.Anchored = true
        part.Parent = workspace
    end
end

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        character:Destroy()
    end)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(onCharacterAdded)
    player:GetMouse().KeyDown:Connect(function(key)
        onKeyPress(player, key)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

-- End of KeyPressPartCreator.server.lua