--@Services
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

--@Instances
local LocalPlayer = Players.LocalPlayer

--@UI Instances
local CurrentBox = nil
local OldMessage = ""

--@Settings
local JumpAmount = 3 -- The number of letters jumped that counts as a "copy and paste"

--@Local Functions
local function Punish(ChatText) -- Change this function to whatever punishment you like
	print(LocalPlayer.Name .. " copy and pasted " .. ChatText)
end

--@Functions
UserInputService.TextBoxFocused:Connect(function(TextBox)
	pcall(function() -- Wrap it in a pcall in case the player clicks on a CoreGui textbox
		if (TextBox ~= CurrentBox) and (TextBox.Name == "ChatBar") then
			CurrentBox = TextBox -- Set the current box to this
			TextBox.FocusLost:Connect(function(EnterPressed)
				if (EnterPressed) then -- If the player enters their chat message
					local ChatText = TextBox.Text -- Define the current chat text
					if (string.len(ChatText) - string.len(OldMessage)) > JumpAmount then -- If the player crosses the jump amount
						Punish(ChatText) -- Confirmed copying and pasting
					end
				end
			end)
		end
	end)
end)
