local A, L = ...

local cvars = {
  nameplateMinScale = 1,
  nameplateMaxScale = 1,
  nameplateMinScaleDistance = 0,
  nameplateMaxScaleDistance = 40,
  nameplateGlobalScale = 1,
  NamePlateHorizontalScale = 1,
  NamePlateVerticalScale = 1,
  nameplateSelfScale = 1,
  nameplateSelectedScale = 1,
  nameplateLargerScale = 1,
  nameplateShowFriendlyNPCs = 0,
  nameplateMinAlpha = 0.5,
  nameplateMaxAlpha = 0.5,
  nameplateMinAlphaDistance = 0,
  nameplateMaxAlphaDistance = 40,
  nameplateSelectedAlpha = 1,
  nameplateOccludedAlphaMult = 0,
}
L.C.NamePlateCVars = cvars

local function FilterAuraBuffs(element, unit, data)
  local nameplateShowSelf = data.nameplateShowSelf
  local nameplateShowAll = data.nameplateShowAll
  local isFromPlayerOrPlayerPet = data.isFromPlayerOrPlayerPet

  return nameplateShowSelf or nameplateShowAll or isFromPlayerOrPet
end

local function FilterAuraDebuffs(element, unit, data)
  local nameplateShowSelf = data.nameplateShowSelf
  local nameplateShowAll = data.nameplateShowAll
  local isFromPlayerOrPlayerPet = data.isFromPlayerOrPlayerPet

  return nameplateShowSelf or nameplateShowAll or isFromPlayerOrPlayerPet
end

L.C.nameplate = {
  enabled = true,
  friendly_only_name = true,

  size = { 180, 25 },
  point = { "CENTER" },
  scale = 1 * UIParent:GetScale() * L.C.globalscale,

  healthbar = {
    colorThreat = true,
    colorThreatInvers = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,

    frequentUpdates = true,

    name = {
      enabled = true,
      size = 12,
      points = {
        { "LEFT", 5, 1 },
        { "RIGHT", 5, 1 },
      },
      align = "LEFT",
      tag = "[name]|r",
      noshadow = true,
    },
  },

  castbar = {
    enabled = true,
    size = { 180, 20 },
    point = { "TOP", "BOTTOM", 0, -5 },

    name = {
      enabled = true,
      size = 12,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
    },

    icon = {
      enabled = true,
      size = { 26, 26 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },
  },

  buffs = {
    enabled = false,
    size = 22,
    point = { "BOTTOM", "TOP", 0, 25 },
    num = 10,
    cols = 4,
    spacing = 5,
    initialAnchor = "BOTTOMLEFT",
    growthX = "RIGHT",
    growthY = "UP",
    disableCooldown = true,
    filter = "HELPFUL|INCLUDE_NAME_PLATE_ONLY",
    FilterAura = FilterAuraBuffs,
  },

  debuffs = {
    enabled = true,
    size = 25,
    point = { "BOTTOMLEFT", "TOPLEFT", 0, 5 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "UP",
    disableCooldown = false,
    filter = "HARMFUL|PLAYER|INCLUDE_NAME_PLATE_ONLY",
    FilterAura = FilterAuraDebuffs,
  },

  raidicon = {
    enabled = true,
    size = { 30, 30 },
    point = { "RIGHT", "LEFT", -5, 0 },
  },
}
