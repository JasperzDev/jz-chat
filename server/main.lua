function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		name = getIdentity(source)
		TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
	end
end)

RegisterCommand('twt', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
        args = { fal, msg }
    })

    local steamid = false
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        end
    end
	sendToDiscord("https://discord.com/api/webhooks/865234032298819594/5kguWU8PJLYy5fjXNSKUVf-5p5A0LA55dtPjJzCtw5HH9MkNXMBamwl8hmT3YkqYBfD9", "Twt Logs", "**Naam: **" .. GetPlayerName(source) .. "\n **ID: **" ..source .. "\n **Steam:** " .. steamid .. "\n **Stuurt:** /" .. rawCommand .. "", 3066993)
end, false)

RegisterCommand('ano', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> Anoniem:<br> {1}<br></div>',
        args = { fal, msg }
    })

    local steamid = false
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        end
    end
	sendToDiscord("https://discord.com/api/webhooks/865233913668698112/sA3AeH_F7Rg73XSk2bSHP1dbfczVD8S9zL7r8l4ETBzIttWZHCKCqpeI-l9fVvt--GQu", "Ano Logs", "**Naam: **" .. GetPlayerName(source) .. "\n **ID: **" ..source .. "\n **Steam:** " .. steamid .. "\n **Stuurt:** /" .. rawCommand .. "", 3066993)
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw !important;  margin: 0.5vw; background-color: rgba(105, 105, 105, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
        args = { playerName, msg }
    })

    local steamid = false
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        end
    end
	sendToDiscord("https://discord.com/api/webhooks/866309690753548309/-QKK93aIDMgYtdyiW0EnbhbABs-2R-WvXwk265BfPUv0q2FFMnaX5q0OEd6y-yivNgto", "OOC Logs", "**Naam: **" .. GetPlayerName(source) .. "\n **ID: **" ..source .. "\n **Steam:** " .. steamid .. "\n **Stuurt:** /" .. rawCommand .. "", 3066993)
end, false)

RegisterCommand('ad', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(214, 168, 0, 0.6); border-radius: 3px;"><i class="fas fa-ad"></i> Advertentie:<br> {1}</div>',
        args = { fal, msg }
    })

    local steamid = false
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        end
    end
	sendToDiscord("https://discord.com/api/webhooks/866673513199697921/VwB5DmIr__9PSRJpqiPaFWpH608GfVPZKgiH-8F-iWKLm6eES5vShJb0q9X3-1UtA5HU", "Ad Logs", "**Naam: **" .. GetPlayerName(source) .. "\n **ID: **" ..source .. "\n **Steam:** " .. steamid .. "\n **Stuurt:** /" .. rawCommand .. "", 3066993)
end, false)

function sendToDiscord(webhook, name, message, color)
  local connect = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
            ["text"] = "JZ Logs • " ..os.date("%x %X %p"),
            },
        }
    }
  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "JZ Logs", embeds = connect}), { ['Content-Type'] = 'application/json' })
end