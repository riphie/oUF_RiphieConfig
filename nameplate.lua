local _, L = ...

local _, class = UnitClass "player"

local NamePlateCVars = {
  nameplateMinScale = 1,
  nameplateMaxScale = 1,

  nameplateMinScaleDistance = 0,
  nameplateMaxScaleDistance = 40,

  nameplateGlobalScale = 0.70,
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

local function FilterAuraBuffs(_, _, data)
  -- Only show buffs that are purgable/stealable or in the allow list
  return data.isStealable or L.C.NamePlateBuffAllowList[data.spellId]
end

local function FilterAuraDebuffs(_, _, data)
  local isPlayer = UnitIsPlayer(data.sourceUnit)

  if L.C.NamePlateDebuffAllowList[class] then
    return isPlayer and L.C.NamePlateDebuffAllowList[class][data.spellId]
  end

  return isPlayer
end

local important = { 0.98, 0.50, 0.45 } -- Peach

local interruptable = { 1, 0, 1, 1 } -- Magenta
local secondaryInterruptable = { 0.96, 0.55, 0.73 } -- Pink
local stunnable = { 0, 1, 0, 1 } -- Lime
local secondaryStunnable = { 0, 0, 1, 1 } -- Blue
local highPriority = { 0, 1, 1, 1 } -- Cyan
local frontal = { 0.78, 0.61, 0.43 } -- Brown

local NamePlateCustomUnits = {
  -- Debugging
  [189617] = secondaryStunnable, -- Boulderfist

  -- Mythic+ Affixes
  [174773] = important, -- Spiteful Shade
}
L.C.NamePlateCustomUnits = NamePlateCustomUnits

local function NamePlateCallback(self, event, unit)
  if event == "NAME_PLATE_UNIT_ADDED" then
    self.blizzPlate = self:GetParent().UnitFrame
    self.widgetsOnly = UnitNameplateShowsWidgetsOnly(unit)
    self.widgetSet = UnitWidgetSet(unit)

    if self.widgetsOnly then
      self.Health:SetAlpha(0)
      self.widgetContainer = self.blizzPlate.WidgetContainer

      if self.widgetContainer then
        self.widgetContainer:SetParent(self)
        self.widgetContainer:ClearAllPoints()
        self.widgetContainer:SetPoint("BOTTOM", self, "BOTTOM")
      end
    end
  elseif event == "NAME_PLATE_UNIT_REMOVED" then
    if self.widgetsOnly and self.widgetContainer then
      self.Health:SetAlpha(1)
      self.widgetContainer:SetParent(self.blizzPlate)
      self.widgetContainer:ClearAllPoints()
      self.widgetContainer:SetPoint("TOP", self.blizzPlate.castBar, "BOTTOM")
    end
  end
end
L.C.NamePlateCallback = NamePlateCallback

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
        { "TOP", 0, 13 },
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
    point = { "BOTTOMRIGHT", "TOPRIGHT", 0, 20 },
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
    point = { "BOTTOMLEFT", "TOPLEFT", 0, 20 },
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
