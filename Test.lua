if not _G.SSaimbot then
    _G.SSaimbot = true
    local lp = game.Players.LocalPlayer
    local ts = game:GetService("TweenService")
    local camera = workspace.CurrentCamera
    local m = lp:GetMouse()
    local activated = false
    local squares = {}
    m.KeyDown:Connect(function(k)
        if k == _G.toggle then
            activated = not activated
            warn("aimbot:", activated)
        end
    end)
    workspace.DescendantAdded:Connect(function(EffectColor)
        if activated and EffectColor.Name == "EffectColor" then
            table.insert(squares, EffectColor.Parent)
        end
    end)
    game:GetService("RunService").Heartbeat:Connect(function()
        if activated then
            if squares[1] and squares[1].Parent then
                ts:Create(camera, TweenInfo.new(_G.smoothness + ((camera.CFrame.Position - squares[1].Position).Magnitude - _G.sensitivity) / math.min(_G.reaction_time, 67), _G.movement, Enum.EasingDirection.Out), {CFrame = CFrame.new(camera.CFrame.Position, squares[1].Position + (squares[1].CFrame.RightVector * ((camera.CFrame.Position - squares[1].Position).Magnitude - _G.sensitivity)))}):Play()    
            else
                table.remove(squares, 1)
            end
        end
    end)
    warn("Checking checking ... ")
    warn("...")
    wait(0.1)
    warn("...")
    wait(0.1)
    warn("Working!!!")
end
