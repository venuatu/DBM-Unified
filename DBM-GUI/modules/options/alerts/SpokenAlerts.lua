local L = DBM_GUI_L

local spokenAlertsPanel = DBM_GUI.Cat_Alerts:CreateNewPanel(L.Panel_SpokenAlerts, "option")

local spokenGeneralArea = spokenAlertsPanel:CreateArea(L.Area_VoiceSelection)

local CountSoundDropDown = spokenGeneralArea:CreateDropdown(L.CountdownVoice, DBM:GetCountSounds(), "DBM", "CountdownVoice", function(value)
	DBM.Options.CountdownVoice = value
	DBM:PlayCountSound(1, DBM.Options.CountdownVoice)
	DBM:BuildVoiceCountdownCache()
end, 180)
CountSoundDropDown:SetPoint("TOPLEFT", spokenGeneralArea.frame, "TOPLEFT", 0, -20)

local CountSoundDropDown2 = spokenGeneralArea:CreateDropdown(L.CountdownVoice2, DBM:GetCountSounds(), "DBM", "CountdownVoice2", function(value)
	DBM.Options.CountdownVoice2 = value
	DBM:PlayCountSound(1, DBM.Options.CountdownVoice2)
	DBM:BuildVoiceCountdownCache()
end, 180)
CountSoundDropDown2:SetPoint("LEFT", CountSoundDropDown, "RIGHT", 45, 0)
CountSoundDropDown2.myheight = 0

local CountSoundDropDown3 = spokenGeneralArea:CreateDropdown(L.CountdownVoice3, DBM:GetCountSounds(), "DBM", "CountdownVoice3", function(value)
	DBM.Options.CountdownVoice3 = value
	DBM:PlayCountSound(1, DBM.Options.CountdownVoice3)
	DBM:BuildVoiceCountdownCache()
end, 180)
CountSoundDropDown3:SetPoint("TOPLEFT", CountSoundDropDown, "TOPLEFT", 0, -45)

local voices = DBM.Voices
if not DBM.VoiceVersions[DBM.Options.ChosenVoicePack2] then -- Sound pack is missing, add a custom entry of "missing"
	table.insert(voices, { text = L.MissingVoicePack:format(DBM.Options.ChosenVoicePack2), value = DBM.Options.ChosenVoicePack2 })
end
local VoiceDropDown = spokenGeneralArea:CreateDropdown(L.VoicePackChoice, voices, "DBM", "ChosenVoicePack2", function(value)
	DBM.Options.ChosenVoicePack2 = value
	DBM:CheckVoicePackVersion(value)
end, 180)
VoiceDropDown:SetPoint("TOPLEFT", CountSoundDropDown2, "TOPLEFT", 0, -45)
VoiceDropDown.myheight = 20 -- TODO: +10 padding per dropdown text

local voiceReplaceArea		= spokenAlertsPanel:CreateArea(L.Area_VoicePackReplace)
local VPReplaceAnnounce		= voiceReplaceArea:CreateCheckButton(L.ReplacesAnnounce, true, nil, "VPReplacesAnnounce")
local VPReplaceSA1			= voiceReplaceArea:CreateCheckButton(L.ReplacesSA1, true, nil, "VPReplacesSA1")
local VPReplaceSA2			= voiceReplaceArea:CreateCheckButton(L.ReplacesSA2, true, nil, "VPReplacesSA2")
local VPReplaceSA3			= voiceReplaceArea:CreateCheckButton(L.ReplacesSA3, true, nil, "VPReplacesSA3")
local VPReplaceSA4			= voiceReplaceArea:CreateCheckButton(L.ReplacesSA4, true, nil, "VPReplacesSA4")
local VPReplaceCustom		= voiceReplaceArea:CreateCheckButton(L.ReplacesCustom, true, nil, "VPReplacesCustom")

--TODO, add note (L.VPReplaceNote) either above or below the replace checkboxes and within voiceReplaceArea

local voiceAdvancedArea		= spokenAlertsPanel:CreateArea(L.Area_VoicePackAdvOptions)
local VPF1					= voiceAdvancedArea:CreateCheckButton(L.SpecWarn_AlwaysVoice, true, nil, "AlwaysPlayVoice")

local VPUrlArea1		= spokenAlertsPanel:CreateArea(L.Area_BrowseOtherVP)
VPUrlArea1:CreateText(L.BrowseOtherVPs, nil, true, nil, "LEFT")
VPUrlArea1.frame:SetScript("OnMouseUp", function()
	DBM:ShowUpdateReminder(nil, nil, L.Area_BrowseOtherVP, "https://www.curseforge.com/wow/addons/search?search=dbm+voice")
end)

local VPUrlArea2		= spokenAlertsPanel:CreateArea(L.Area_BrowseOtherCT)
VPUrlArea2:CreateText(L.BrowseOtherCTs, nil, true, nil, "LEFT")
VPUrlArea2.frame:SetScript("OnMouseUp", function()
	DBM:ShowUpdateReminder(nil, nil, L.Area_BrowseOtherCT, "https://www.curseforge.com/wow/addons/search?search=dbm+count+pack")
end)
