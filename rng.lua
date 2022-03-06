-- Variables, webhooks, services --

local http = game:GetService("HttpService")
local detailsWebhook = "DISCORD WEBHOOK HERE"
local altWebhook = "DISCORD WEBHOOK HERE"
local min, max, final = ("a"):byte(), ("z"):byte(), ""
local debris = game:GetService("Debris")

-- Main loop --

while wait(2) do
	local rng = math.random(1, 10)
	if rng >= 5 then -- if rng is greater or equal to 5. (50% chance)
		
		-- Variables --
		
		local verify = true
		local randomPos, randomPos2 = math.random(1, 25), math.random(1, 25)
		
		-- Part information --
		
		local part = Instance.new("Part", workspace)
		part.Anchored = true
		part.Position = Vector3.new(randomPos, 0, randomPos2)
		part.Size = Vector3.new(math.random(1, 10), math.random(1, 10), math.random(1, 10))
		
		-- Function and for loop for the spawn method --
		
		function lol()
			for i = 1, math.random(1, 100), 1 do
				part.Position = Vector3.new(randomPos, i, randomPos2)
				wait()
			end
		end
		
		spawn(lol)
		
		-- Variables --
		
		local pos = tostring(part.Position)
		local size = tostring(part.Size)
		local Var = {0xeb4034, 0x2cc73b, 0x439ce6}
		local ranVar = Var[math.random(#Var)]
		
		-- Discord Webhook Information --
		
		local content = {
			["content"] = "",
			["embeds"] = {{
				["title"] = rng.." is the random number generated.",
				["description"] =
					"**Greater than or equal to 5?:** "..tostring(verify)..","
					.."\n **Anchored:** "..tostring(part.Anchored)..","
					.."\n **CanCollide:** "..tostring(part.CanCollide)..","
					.."\n **Part spawn position:** "..pos..","
					.."\n **Part spawn size:** "..size..".",
				["color"] = tonumber(ranVar),
			}}
		}
		
		data = http:JSONEncode(content)
		http:PostAsync(detailsWebhook, data)
		
		-- Debris Service --
		
		debris:AddItem(part, 5)
	else
		-- Variables --
		
		local verify = false
		
		-- Variables, Webhook Hex Colour Information --
		
		local Var = {0xeb4034, 0x2cc73b, 0x439ce6}
		local ranVar = Var[math.random(#Var)]
		
		-- Discord Webhook Information --
		
		local content = {
			["content"] = "",
			["embeds"] = {{
				["title"] = rng.." is the random number generated.",
				["description"] =
					"**Greater than or equal to 5?:** "..tostring(verify)..".",
				["color"] = tonumber(ranVar),
			}}
		}
		
		data = http:JSONEncode(content)
		http:PostAsync(altWebhook, data)
		
		print("man. i wish "..rng.." was greater or equal to 5..")
	end
end
