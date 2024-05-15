local _, L = ...

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

  -- Algeth'ar Academy
  [190609] = frontal, -- Echo of Doragosa
  [191736] = frontal, -- Crawth
  [192333] = interruptable, -- Alpha Eagle
  [194181] = frontal, -- Vexamus
  [196044] = interruptable, -- Unruly Textbook
  [196200] = stunnable, -- Algeth'ar Echoknight
  [196202] = interruptable, -- Spectral Invoker
  [196548] = interruptable, -- Ancient Branch
  [196576] = stunnable, -- Spellbound Scepter
  [196671] = frontal, -- Arcane Ravager
  [197398] = interruptable, -- Hungry Lasher

  -- The Azure Vault
  [186644] = frontal, -- Leymor
  [186738] = frontal, -- Umbrelskul
  [186739] = frontal, -- Azureblade
  [186740] = frontal, -- Arcane Construct
  [187154] = interruptable, -- Unstable Curator
  [187155] = interruptable, -- Rune Seal Keeper
  [187246] = stunnable, -- Nullmagic Hornswog
  [188100] = stunnable, -- Shrieking Whelp
  [189555] = stunnable, -- Astral Attendant
  [190510] = stunnable, -- Vault Guard
  [191164] = interruptable, -- Arcane Tender
  [191739] = frontal, -- Scalebane Lieutenant
  [196102] = interruptable, -- Conjured Lasher
  [196115] = interruptable, -- Arcane Tender
  [196116] = frontal, -- Crystal Fury

  -- Brackenhide Hollow
  [185508] = stunnable, -- Claw Fighter
  [185528] = interruptable, -- Trickclaw Mystic
  [185529] = interruptable, -- Bracken Warscourge
  [185534] = stunnable, -- Bonebolt Hunter
  [185656] = interruptable, -- Filth Caller
  [186120] = frontal, -- Treemouth
  [186122] = frontal, -- Rira Hackclaw
  [186125] = interruptable, -- Tricktotem
  [186191] = interruptable, -- Decay Speaker
  [186206] = stunnable, -- Cruel Bonecrusher
  [186208] = frontal, -- Rotbow Stalker
  [186220] = interruptable, -- Brackenhide Shaper
  [186226] = interruptable, -- Fetid Rotsinger
  [186229] = frontal, -- Wilted Oak
  [186246] = interruptable, -- Fleshripper Vulture
  [187033] = frontal, -- Stinkbreath
  [187231] = stunnable, -- Wither Biter
  [187315] = stunnable, -- Disease Slasher
  [189299] = interruptable, -- Decaying Slime
  [192481] = interruptable, -- Decaying Slime
  [194330] = interruptable, -- Decaying Slime
  [195135] = interruptable, -- Bracken Warscourge
  [199916] = interruptable, -- Decaying Slime

  -- Halls of Infusion
  [189727] = frontal, -- Khajin the Unyielding
  [190340] = frontal, -- Refti Defender
  [190342] = interruptable, -- Containment Apparatus
  [190345] = interruptable, -- Primalist Geomancer
  [190348] = interruptable, -- Primalist Ravager
  [190362] = frontal, -- Dazzling Dragonfly
  [190368] = interruptable, -- Flamecaller Aymi
  [190371] = frontal, -- Primalist Earthshaker
  [190373] = stunnable, -- Primalist Galesinger
  [190377] = interruptable, -- Primalist Icecaller
  [190401] = frontal, -- Gusting Proto-Dragon
  [190403] = frontal, -- Glacial Proto-Dragon
  [190404] = frontal, -- Subterranean Proto-Dragon
  [190405] = interruptable, -- Infuser Sariya
  [190407] = interruptable, -- Aqua Rager
  [196043] = interruptable, -- Primalist Infuser
  [196712] = stunnable, -- Nullification Device
  [199037] = interruptable, -- Primalist Shocktrooper

  -- Neltharus
  [181861] = frontal, -- Magmatusk
  [189227] = stunnable, -- Qalashi Hunter
  [189235] = interruptable, -- Overseer Lahar
  [189247] = interruptable, -- Tamed Phoenix
  [189265] = interruptable, -- Qalashi Bonetender
  [189266] = frontal, -- Qalashi Trainee
  [189340] = frontal, -- Chargath, Bane of Scales
  [189464] = frontal, -- Qalashi Irontorch
  [189467] = stunnable, -- Qalashi Bonesplitter
  [189470] = interruptable, -- Lava Flare
  [192464] = stunnable, -- Raging Ember
  [192786] = stunnable, -- Qalashi Plunderer
  [192788] = interruptable, -- Qalashi Thaumaturge
  [193293] = frontal, -- Qalashi Warden
  [193944] = interruptable, -- Qalashi Lavamancer

  -- The Nokhud Offensive
  [186151] = frontal, -- Balakar Khan
  [186339] = interruptable, -- Teera
  [190294] = interruptable, -- Nokhud Stormcaster
  [191847] = interruptable, -- Nokhud Plainstomper
  [192794] = stunnable, -- Nokhud Beastmaster
  [192796] = stunnable, -- Nokhud Hornsounder
  [192800] = interruptable, -- Nokhud Lancemaster
  [193373] = interruptable, -- Nokhud Thunderfist
  [193462] = interruptable, -- Batak
  [194315] = interruptable, -- Stormcaller Solongo
  [194316] = interruptable, -- Stormcaller Zarii
  [194317] = interruptable, -- Stormcaller Boroo
  [194894] = interruptable, -- Primalist Stormspeaker
  [194895] = interruptable, -- Unstable Squall
  [195265] = interruptable, -- Stormcaller Arynga
  [195696] = interruptable, -- Primalist Thunderbeast
  [195842] = interruptable, -- Ukhel Corruptor
  [195851] = stunnable, -- Ukhel Deathspeaker
  [195876] = frontal, -- Desecrated Ohuna
  [195877] = interruptable, -- Risen Mystic
  [195878] = interruptable, -- Ukhel Beastcaller
  [195927] = interruptable, -- Soulharvester Galtmaa
  [195928] = interruptable, -- Soulharvester Duuren
  [195929] = interruptable, -- Soulharvester Tumen
  [195930] = interruptable, -- Soulharvester Mandakh
  [199717] = interruptable, -- Nokhud Defender

  -- Ruby Life Pools
  [187894] = interruptable, -- Infused Whelp
  [187969] = stunnable, -- Flashfrost Earthshaper
  [188067] = interruptable, -- Flashfrost Chillweaver
  [189886] = interruptable, -- Blazebound Firestorm
  [189893] = interruptable, -- Infused Whelp
  [190206] = stunnable, -- Primalist Flamedancer
  [190207] = interruptable, -- Primalist Cinderweaver
  [190484] = frontal, -- Kyrakka
  [195119] = interruptable, -- Primalist Shockcaster
  [197535] = interruptable, -- High Channeler Ryvati
  [197697] = frontal, -- Flamegullet
  [197698] = frontal, -- Thunderhead
  [197985] = interruptable, -- Flame Channeler
  [198047] = interruptable, -- Tempest Channeler

  -- Uldaman: Legacy of Tyr
  [184022] = interruptable, -- Stonevault Geomancer
  [184023] = interruptable, -- Vicious Basilisk
  [184125] = frontal, -- Chrono-Lord Deios
  [184130] = frontal, -- Earthen Custodian
  [184132] = interruptable, -- Earthen Warder
  [184301] = interruptable, -- Cavern Seeker
  [184319] = stunnable, -- Refti Custodian
  [184335] = stunnable, -- Infinite Agent
  [184422] = frontal, -- Emberon
  [184580] = interruptable, -- Olaf
  [184581] = frontal, -- Baelog
  [186420] = stunnable, -- Earthen Weaver
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
