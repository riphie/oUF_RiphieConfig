local A, L = ...

local _, class = UnitClass("player")

local NamePlateCVars = {
  nameplateMinScale = 1,
  nameplateMaxScale = 1,

  nameplateMinScaleDistance = 0,
  nameplateMaxScaleDistance = 40,

  nameplateGlobalScale = 1,
  NamePlateHorizontalScale = 1,
  NamePlateVerticalScale = 1,
  nameplateSelfScale = 1,
  nameplateSelectedScale = 1.1,
  nameplateLargerScale = 1,

  nameplateShowFriendlyNPCs = 0,

  nameplateMinAlpha = 0.6,
  nameplateMaxAlpha = 0.6,

  nameplateMinAlphaDistance = 0,
  nameplateMaxAlphaDistance = 40,

  nameplateSelectedAlpha = 1,
  nameplateOccludedAlphaMult = 0.8,
}
L.C.NamePlateCVars = NamePlateCVars

local NamePlateBuffAllowList = {}

local function FilterAuraBuffs(element, unit, data)
  -- Only show buffs that are purgable/stealable or in the allow list
  return data.isStealable or NamePlateBuffAllowList[data.spellId]
end

local NamePlateDebuffAllowList = {
  -- ["DEATH_KNIGHT"] = {},
  ["DEMONHUNTER"] = {
    [179057] = true, -- Chaos Nova
    [204490] = true, -- Sigil of Silence
    [204598] = true, -- Sigil of Flame
    [207771] = true, -- Fiery BRand
    [247456] = true, -- Frailty
  },
  -- ["DRUID"] = {},
  -- ["EVOKER"] = {},
  -- ["HUNTER"] = {},
  -- ["MAGE"] = {},
  -- ["MONK"] = {},
  -- ["PALADIN"] = {},
  -- ["PRIEST"] = {},
  -- ["SHAMAN"] = {},
  ["ROGUE"] = {
    [1943] = true, -- Rupture
    [316220] = true, -- Find Weakness
  },
  -- ["WARLOCK"] = {},
  ["WARRIOR"] = {
    [355] = true, -- Taunt
    [1160] = true, -- Demoralizing Shout
    [132168] = true, -- Shockwave
    [132169] = true, -- Storm Bolt
    [397364] = true, -- Thunderous Roar
  },
}

local function FilterAuraDebuffs(element, unit, data)
  if NamePlateDebuffAllowList[class] then
    return data.isFromPlayerOrPlayerPet and NamePlateDebuffAllowList[class][data.spellId]
  end

  return data.isFromPlayerOrPlayerPet
end

local NamePlateCustomUnits = {
  [194649] = { 1, 0, 1 }, -- Normal Raid Dummy (Valdrakken)
  [194644] = { 1, 0.2, 0.3 }, -- Dungeoneer's Training Dummy (Valdrakken)
}
L.C.NamePlateCustomUnits = NamePlateCustomUnits

L.C.nameplate = {
  enabled = true,

  size = { 180, 15 },
  point = { "CENTER" },
  scale = 1 * UIParent:GetScale() * L.C.globalscale,

  healthbar = {
    colorDisconnected = false,
    colorReaction = false,
    colorClass = false,
    colorHealth = false,
    colorThreat = false,

    frequentUpdates = true,

    name = {
      enabled = true,
      points = {
        { "CENTER", 0, 8 },
      },
      font = L.C.font,
      size = 14,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_RiphieConfig:name]",
    },
  },

  castbar = {
    enabled = true,
    size = { 180, 20 },
    point = { "TOP", "BOTTOM", 0, -5 },

    name = {
      enabled = true,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
    },

    icon = {
      enabled = true,
      size = { 26, 26 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },
  },

  buffs = {
    enabled = true,

    size = 25,
    point = { "BOTTOMRIGHT", "TOPRIGHT", 0, 8 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "BOTTOMRIGHT",
    growthX = "LEFT",
    growthY = "UP",
    disableCooldown = true,
    filter = "HELPFUL|INCLUDE_NAME_PLATE_ONLY",

    FilterAura = FilterAuraBuffs,

    duration = {
      point = { "TOP", 0, 0 },
      font = L.C.font,
      size = 10,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },

    count = {
      point = { "BOTTOMRIGHT", 1, -1 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },
  },

  debuffs = {
    enabled = true,

    size = 25,
    point = { "BOTTOMLEFT", "TOPLEFT", 0, 8 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "UP",
    disableCooldown = true,
    filter = "HARMFUL|PLAYER|INCLUDE_NAME_PLATE_ONLY",

    FilterAura = FilterAuraDebuffs,

    duration = {
      point = { "TOP", 0, 0 },
      font = L.C.font,
      size = 10,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },

    count = {
      point = { "BOTTOMRIGHT", 1, -1 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },
  },

  raidicon = {
    enabled = true,
    size = { 28, 28 },
    point = { "RIGHT", "LEFT", -5, 0 },
  },
}
