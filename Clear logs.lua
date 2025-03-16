local UserInputService = game:GetService('UserInputService');
local TextChatService = game:GetService('TextChatService');
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
	local chatBox = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
	for i = 1, 20 do
		chatBox.TargetTextChannel:SendAsync('')
	end
else
	local Path1 = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
	 if not Path1 then return error("DefaultChatSystemChatEvents is missing!\nChat logs will not be cleared.") end
	 local Path2 = Path1:FindFirstChild('SayMessageRequest')
	 if not Path2 then return error("SayMessageRequest is missing!\nChat logs will not be cleared.") end
	 for i = 1, 20 do
	  Path2:FireServer('', 'All')
	 end
	task.wait(2)
end

