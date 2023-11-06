local A, L = ...

local _, class = UnitClass "player"

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

local function FilterAuraBuffs(element, unit, data)
  -- Only show buffs that are purgable/stealable or in the allow list
  return data.isStealable or L.C.NamePlateBuffAllowList[data.spellId]
end

local function FilterAuraDebuffs(element, unit, data)
  local isPlayer = UnitIsPlayer(data.sourceUnit)

  if L.C.NamePlateDebuffAllowList[class] then
    return isPlayer and L.C.NamePlateDebuffAllowList[class][data.spellId]
  end

  return isPlayer
end

local important = { 0.98, 0.50, 0.45 } -- Peach

local interruptable = { 1, 0, 1, 1 }
local secondaryInterruptable = { 0.96, 0.55, 0.73 }
local stunnable = { 0, 1, 0, 1 }
local secondaryStunnable = { 0, 0, 1, 1 }
local highPriority = { 0, 1, 1, 1 }
local frontal = { 0.78, 0.61, 0.43 }

local NamePlateCustomUnits = {
  -- Debugging
  [189617] = secondaryStunnable, -- Boulderfist

  -- Mythic+ Affixes
  [174773] = important, -- Spiteful Shade

  -- Atal'Dazar
  [122969] = secondaryInterruptable, -- Zanchuli Witch-Doctor
  [122970] = stunnable, -- Shadowblade Stalker
  [122972] = interruptable, -- Dazar'ai Augur
  [127757] = highPriority, -- Reanimated Honor Guard
  [127799] = frontal, -- Dazar'ai Honor Guard
  [127879] = frontal, -- Shieldbearer of Zul
  [128434] = secondaryInterruptable, -- Feasting Skyscreamer
  [129552] = frontal, -- Monzumi
  [129553] = interruptable, -- Dinomancer Kish'o
  [135989] = frontal, -- Shieldbearer of Zul

  -- Black Rook Hold
  [98243] = frontal, -- Soul-Torn Champion
  [98366] = stunnable, -- Ghostly Retainer
  [98368] = frontal, -- Ghostly Protector
  [98538] = highPriority, -- Lady Velandras Ravencrest
  [98691] = stunnable, -- Risen Scout
  [98706] = frontal, -- Commander Shemdah'sohn
  [98792] = stunnable, -- Wyrmtongue Scavenger
  [98810] = frontal, -- Wrathguard Bladelord
  [102094] = frontal, -- Risen Swordsman
  [102095] = stunnable, -- Risen Lancer
  [102788] = secondaryInterruptable, -- Felspite Dominator

  -- Darkheart Thicket
  [95766] = frontal, -- Crazed Razorbeak
  [95769] = interruptable, -- Mindshattered Screecher
  [95771] = secondaryInterruptable, -- Dreadsoul Ruiner
  [99359] = highPriority, -- Rotheart Keeper
  [99366] = interruptable, -- Taintheart Summoner
  [100526] = frontal, -- Tormented Bloodseeker
  [100527] = secondaryInterruptable, -- Dreadfire Imp
  [100531] = frontal, -- Bloodtainted Fury
  [101991] = secondaryInterruptable, -- Nightmare Dweller

  -- Dawn of the Infinites
  [199748] = interruptable, -- Timeline Marauder
  [199749] = frontal, -- Timestream Anomaly
  [201222] = highPriority, -- Valow, Timesworn Keeper
  [201223] = secondaryInterruptable, -- Infinite Twilight Magus
  [204918] = interruptable, -- Iridikron's Creation
  [205151] = frontal, -- Tyr's Vanguard
  [205152] = highPriority, -- Lerai, Timesworn Maiden
  [205158] = highPriority, -- Spurlok, Timesworn Sentinel
  [205363] = secondaryInterruptable, -- Time-Lost Waveshaper
  [205384] = secondaryInterruptable, -- Infinite Chronoweaver
  [205408] = frontal, -- Infinite Timeslicer
  [205691] = interruptable, -- Iridikron's Creation
  [205727] = interruptable, -- Time-Lost Rocketeer
  [205804] = frontal, -- Risen Dragon
  [206066] = secondaryInterruptable, -- Timestream Leech
  [206140] = interruptable, -- Coalesced Time
  [208698] = interruptable, -- Infinite Riftmage

  -- Everbloom
  [81820] = secondaryInterruptable, -- Everbloom Mender
  [84957] = secondaryInterruptable, -- Putrid Pyromancer
  [84989] = interruptable, -- Infested Icecaller
  [86372] = highPriority, -- Melded Berserker
  [212981] = frontal, -- Hapless Assistant

  -- Throne of the Tides
  [40925] = highPriority, -- Tainted Sentry
  [40935] = stunnable, -- Gilgoblin Hunter
  [40936] = frontal, -- Faceless Watcher
  [40943] = secondaryInterruptable, -- Gilgoblin Aquamage
  [41096] = interruptable, -- Naz'jar Oracle
  [212673] = frontal, -- Naz'jar Ravager
  [212775] = interruptable, -- Faceless Seer

  -- Waycrest Manor
  [131586] = highPriority, -- Banquet Steward
  [131587] = frontal, -- Bewitched Captain
  [131666] = interruptable, -- Coven Thornshaper
  [131812] = interruptable, -- Heartsbane Soulcharmer
  [131821] = interruptable, -- Faceless Maiden
  [135240] = secondaryInterruptable, -- Soul Essence
  [137830] = stunnable, -- Pallid Gorger
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
