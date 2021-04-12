--//

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

--//

local Whitelist = {
	"WorriedStick"
}

--//

local Chat = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
UIS.InputBegan:Connect(function(inp, pro)
	if not pro or not inp.KeyCode then return end
	if table.find(Whitelist, game.Players.LocalPlayer.Name) then return end
	local key = inp.KeyCode.Name
	if key == "V" then
		if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.RightControl) or UIS:IsKeyDown(Enum.KeyCode.LeftMeta) or UIS:IsKeyDown(Enum.KeyCode.RightMeta) then
			Chat.Text = "[COPY AND PASTE]"
		end
	end
end)
OldMsg = ""
Chat.Changed:Connect(function()
	if string.len(Chat.Text) - string.len(OldMsg) >= 10 then
		Chat.Text = "[KEYSTROKE SPEED]"
	end
	OldMsg = Chat.Text
end)