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
  nameplateMinAlpha = 0.3,
  nameplateMaxAlpha = 0.3,
  nameplateMinAlphaDistance = 0,
  nameplateMaxAlphaDistance = 40,
  nameplateSelectedAlpha = 1,
  nameplateOccludedAlphaMult = 0,
}
L.C.NamePlateCVars = cvars

local function CustomFilterBuffs(...)
  local element, unit, button, name, texture, count, debuffType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll, timeMod, effect1, effect2, effect3 =
    ...
  return nameplateShowSelf or nameplateShowAll or (caster == "player" or caster == "pet" or caster == "vehicle")
end

local function CustomFilterDebuffs(...)
  local element, unit, button, name, texture, count, debuffType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll, timeMod, effect1, effect2, effect3 =
    ...
  return nameplateShowSelf or nameplateShowAll or (caster == "player" or caster == "pet" or caster == "vehicle")
end

L.C.nameplate = {
  enabled = true,

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
      size = 13,
      points = {
        { "LEFT", 5, 0 },
        { "RIGHT", 5, 0 },
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
    CustomFilter = CustomFilterBuffs,
  },

  debuffs = {
    enabled = true,
    size = 25,
    point = { "BOTTOMLEFT", "TOPLEFT", 0, 10 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "UP",
    disableCooldown = false,
    filter = "HARMFUL|PLAYER|INCLUDE_NAME_PLATE_ONLY",
    CustomFilter = CustomFilterDebuffs,
  },

  raidicon = {
    enabled = true,
    size = { 40, 40 },
    point = { "BOTTOM", "TOP", 0, 40 },
  },
}
