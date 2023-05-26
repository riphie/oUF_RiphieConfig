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

local frontal = { 20 / 255, 140 / 255, 255 / 225 } -- Blue
local interruptable = { 100 / 255, 240 / 255, 235 / 255 } -- Aqua
local stunnable = { 255 / 255, 0 / 255, 255 / 255 } -- Magenta

local NamePlateCustomUnits = {
  -- Training dummy testing
  [189617] = frontal, -- Boulderfist (Valdrakken)
  [194644] = stunnable, -- Dungeoneer's Training Dummy (Valdrakken)
  [194649] = interruptable, -- Normal Raid Dummy (Valdrakken)

  -- Brackenhide Hollow
  [185508] = stunnable, -- Claw Fighter
  [185528] = interruptable, -- Trickclaw Mystic
  [185529] = interruptable, -- Brackenhide Warscourge
  [185534] = stunnable, -- Bonebolt Hunter
  [185656] = interruptable, -- Filth Caller
  [186120] = frontal, -- Treemouth
  [186122] = frontal, -- Rira Hackclaw
  [186125] = interruptable, -- Tricktotem
  [186191] = interruptable, -- Decay Speaker
  [186206] = stunnable, -- Cruel Bonecrusher
  [186208] = frontal, -- Rotbow Stalker
  [186220] = interruptable, -- Brackenhide Shaper
  [186229] = frontal, -- Wilted Oak
  [186245] = interruptable, -- Fleshripper Vulture
  [187033] = frontal, -- Stinkbreath
  [187231] = stunnable, -- Wither Biter
  [187315] = stunnable, -- Bisease Slasher
  [189299] = interruptable, -- Decaying Slime
  [192481] = interruptable, -- Decaying Slime
  [194330] = interruptable, -- Decaying Slime
  [195135] = interruptable, -- Bracken Warscourge
  [196226] = interruptable, -- Fetid Rotsinger
  [199916] = interruptable, -- Decaying Slime

  -- Halls of Infusion
  [189727] = frontal, -- Khajin the Unyielding
  [190340] = frontal, -- Refti Defender
  [190342] = interruptable, -- Containment Apparatus
  [190345] = interruptable, -- Primalist Geomancer
  [190348] = interruptable, -- Primalist Ravager
  [190362] = frontal, -- Dazzling Dragonfly
  [190371] = frontal, -- Primalist Earthshaker
  [190373] = interruptable, -- Primalist Galesinger
  [190377] = interruptable, -- Primalist Icecaller
  [190386] = interruptable, -- Flamecaller Aymi
  [190401] = frontal, -- Gusting Proto-Dragon
  [190403] = frontal, -- Glacial Proto-Dragon
  [190404] = frontal, -- Subterranean Proto-Dragon
  [190405] = interruptable, -- Infuser Sariya
  [190407] = interruptable, -- Aqua Rager
  [196043] = interruptable, -- Primalist Infuser
  [196712] = stunnable, -- Nullification Device
  [199037] = interruptable, -- Primalist Shocktrooper

  -- Uldaman, Legacy of Tyr
  [184022] = interruptable, -- Stonevault Geomancer
  [184023] = interruptable, -- Vicious Basilisk
  [184125] = frontal, -- Chrono-Lord Deios
  [184130] = frontal, -- Earthen Custodian
  [184132] = interruptable, -- Earthen Warder
  [184301] = interruptable, -- Cavern Seeker
  [184319] = stunnable, -- Refti Custodian
  [184331] = stunnable, -- Infinite Timereaver
  [184335] = stunnable, -- Infinite Agent
  [184422] = frontal, -- Emberon
  [184580] = interruptable, -- Olaf
  [184581] = frontal, -- Baelog
  [186420] = stunnable, -- Earthen Weaver
  [186658] = interruptable, -- Stonevault Geomancer

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

  -- Freehold
  [126832] = frontal, -- Skycap'n Kragg
  [126848] = frontal, -- Captain Eudora
  [126918] = stunnable, -- Irontide Crackshot
  [126919] = interruptable, -- Irontide Stormcaller
  [126969] = frontal, -- Trothak
  [127106] = stunnable, -- Irontide Officer
  [127111] = interruptable, -- Irontide Oarsman
  [129547] = interruptable, -- Blacktooth Knuckleduster
  [129548] = stunnable, -- Blacktooth Brute
  [129559] = stunnable, -- Cutwater Duelist
  [129600] = interruptable, -- Bilge Rat Brinescale
  [129602] = frontal, -- Irontide Enforcer
  [129758] = stunnable, -- Irontide Grenadier
  [129788] = interruptable, -- Irontide Bonesaw
  [130011] = stunnable, -- Irontide Buccaneer

  -- The Underrot
  [130909] = frontal, -- Fetid Maggot
  [131318] = interruptable, -- Elder Leaxa
  [131383] = frontal, -- Sporecaller Zancha
  [131436] = frontal, -- Chosen Blood Matron
  [131492] = interruptable, -- Devout Blood Priest
  [131817] = frontal, -- Cragmaw the Infested
  [133007] = frontal, -- Unbound Abomination
  [133663] = stunnable, -- Fanatical Headhunter
  [133835] = interruptable, -- Feral Bloodswarmer
  [133870] = interruptable, -- Diseased Lasher
  [133912] = interruptable, -- Bloodsworm Defiler
  [134284] = interruptable, -- Fallen Deathspeaker
  [134701] = interruptable, -- Blood Effigy
  [138187] = interruptable, -- Grotesque Horror
  [138281] = frontal, -- Faceless Corruptor

  -- Neltharion's Lair
  [90997] = frontal, -- Mightstone Breaker
  [90998] = interruptable, -- Blightshard Shaper
  [91000] = frontal, -- Vileshard Hulk
  [91001] = interruptable, -- Tarsppitter Lurker
  [91003] = frontal, -- Rokmora
  [91007] = frontal, -- Dargrul
  [91008] = stunnable, -- Rockbound Pelter
  [92538] = stunnable, -- Tarspitter Grub
  [98406] = stunnable, -- Embershard Scorpion
  [102232] = interruptable, -- Rockbound Trapper
  [102287] = frontal, -- Emberhusk Dominator
  [102295] = frontal, -- Emberhusk Dominator
  [113536] = frontal, -- Emberhusk Dominator
  [113537] = frontal, -- Emberhusk Dominator
  [113998] = frontal, -- Mightstone Breaker

  -- The Vortex Pinnacle
  [43873] = frontal, -- Altairus
  [43878] = interruptable, -- Grand Vizier Ertan
  [45477] = frontal, -- Gust Soldier
  [45912] = interruptable, -- Wild Vortex
  [45919] = frontal, -- Young Storm Dragon
  [45922] = interruptable, -- Empyrean Assassin
  [45924] = interruptable, -- Turbulent Squall
  [45930] = interruptable, -- Minister of Air
  [45935] = interruptable, -- Temple Adept
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
