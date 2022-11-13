local A, L = ...

-- config container
L.C = {}

-- tags and events
L.C.tagMethods = {}
L.C.tagEvents = {}

-- make the config global
oUF_RiphieConfig = L.C

local LibStub = LibStub

if LibStub then
  local LSM = LibStub("LibSharedMedia-3.0")
  LSM:Register("statusbar", "Skullflower", "Interface\\AddOns\\" .. A .. "\\media\\Skullflower")
  LSM:Register("statusbar", "Skullflower 2", "Interface\\AddOns\\" .. A .. "\\media\\Skullflower2")
  LSM:Register("statusbar", "Skullflower 3", "Interface\\AddOns\\" .. A .. "\\media\\Skullflower3")
  LSM:Register("statusbar", "Skullflower Light", "Interface\\AddOns\\" .. A .. "\\media\\SkullflowerLight")
end
