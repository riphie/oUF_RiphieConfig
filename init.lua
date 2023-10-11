local A, L = ...

-- config container
L.C = {}

-- tags and events
L.C.tagMethods = {}
L.C.tagEvents = {}

-- make the config global
oUF_RiphieConfig = L.C

local frame = CreateFrame "Frame"
frame:RegisterEvent "PLAYER_ENTERING_WORLD"
frame:SetScript("OnEvent", function()
  SetCVar("nameplateShowOnlyNames", 1)
  C_NamePlate.SetNamePlateFriendlySize(0.1, 0.1)
end)
