local _, L = ...

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

  nameplateMinAlpha = 0.7,
  nameplateMaxAlpha = 0.7,

  nameplateMinAlphaDistance = 0,
  nameplateMaxAlphaDistance = 40,

  nameplateSelectedAlpha = 1,
  nameplateOccludedAlphaMult = 0.3,
}
L.C.NamePlateCVars = NamePlateCVars

local function FilterAuraBuffs(_, _, data)
  -- Only show buffs that are purgable/stealable or in the allow list
  return data.isStealable or L.C.NamePlateBuffAllowList[data.spellId]
end

local function FilterAuraDebuffs(_, _, data)
  local _, class = UnitClass "player"
  local isPlayer = UnitIsPlayer(data.sourceUnit)

  if L.C.NamePlateDebuffAllowList[class] then
    return isPlayer and L.C.NamePlateDebuffAllowList[class][data.spellId]
  end

  return isPlayer
end

-- Borrowed from https://wago.io/PbOvK4iWT

local magenta = { 1, 0, 1, 1 } -- Elite / Lieutenant / Mini Boss
local olive = { 0.501961, 0.501961, 0, 1 } -- Main caster, priority
local deepskyblue = { 0, 0.74902, 1, 1 } -- Secondary caster
local darkorange = { 1, 0.54902, 0, 1 } -- Tank mob
local rogue = { 1.0, 0.96, 0.41 } -- Enrages
local mediumslateblue = { 0.482353, 0.407843, 0.933333, 1 } -- Boss

local NamePlateCustomUnits = {
  -- Mythic+ Affixes
  [225978] = rogue, -- Crystalmaw

  -- Theater of Pain

  [160495] = olive, -- Maniacal Soulbinder
  [162309] = olive, -- Kul'tharok
  [162317] = mediumslateblue, -- Gorechop
  [162329] = mediumslateblue, -- Xav the Unfallen
  [162744] = magenta, -- Nekthara the Mangler
  [162763] = magenta, -- Soulforged Bonereaver
  [163086] = magenta, -- Rancid Gasbag
  [164451] = mediumslateblue, -- Dessia the Decapitator
  [164461] = olive, -- Sathel the Accursed
  [164463] = deepskyblue, -- Paceran the Virulent
  [164506] = olive, -- Ancient Captain
  [164510] = deepskyblue, -- Shambling Arbalest
  [165946] = mediumslateblue, -- Mordretha, "Theater of Pain
  [167532] = magenta, -- Heavin the Breaker
  [167533] = magenta, -- Advent Nevermore
  [167534] = magenta, -- Rek the Hardened
  [167536] = magenta, -- Harugia the Bloodthirsty
  [167538] = magenta, -- Dokigg the Brutalizer
  [167998] = magenta, -- Portal Guardian
  [169875] = deepskyblue, -- Shackled Soul
  [169893] = magenta, -- Nefarious Darkspeaker
  [169927] = darkorange, -- Putrid Butcher
  [170690] = deepskyblue, -- Diseased Horror
  [170850] = rogue, -- Raging Bloodhorn
  [170882] = darkorange, -- Bone Magus
  [174197] = olive, -- Battlefield Ritualist
  [174210] = olive, -- Blighted Sludge-Spewer

  -- The Rookery

  [207186] = deepskyblue, -- Unruly Stormrook
  [207198] = olive, -- Cursed Thunderer
  [207199] = rogue, -- Cursed Rooktender
  [207202] = olive, -- Void Fragment
  [207205] = mediumslateblue, -- Stormguard Gorren
  [207207] = mediumslateblue, -- Voidstone Monstrosity
  [209230] = mediumslateblue, -- Kyrioss
  [209801] = magenta, -- Quartermaster Koratite
  [212739] = magenta, -- Radiating Voidstone
  [212786] = magenta, -- Voidrider
  [212793] = olive, -- Void Ascendant
  [214419] = deepskyblue, -- Void-Cursed Crusher
  [214421] = magenta, -- Coalescing Void Diffuser
  [214439] = olive, -- Corrupted Oracle

  -- The MOTHERLODE!!

  [129214] = mediumslateblue, -- Coin-Operated Crowd Pummeler
  [129227] = mediumslateblue, -- Azerokk
  [129231] = mediumslateblue, -- Rixxa Fluxflame
  [129232] = mediumslateblue, -- Mogul Razdunk
  [130435] = magenta, -- Addled Thug
  [130436] = darkorange, -- Off-Duty Laborer
  [130488] = magenta, -- Mech Jockey
  [130635] = olive, -- Stonefury
  [130653] = deepskyblue, -- Wanton Sapper
  [130661] = olive, -- Venture Co. Earthshaper
  [133345] = deepskyblue, -- Feckless Assistant
  [133430] = magenta, -- Venture Co. Mastermind
  [133432] = olive, -- Venture Co. Alchemist
  [133463] = magenta, -- Venture Co. War Machine
  [133482] = deepskyblue, -- Crawler Mine
  [133593] = olive, -- Expert Technician
  [134012] = magenta, -- Taskmaster Askari
  [134232] = deepskyblue, -- Hired Assassin
  [135975] = darkorange, -- Off-Duty Laborer
  [136139] = magenta, -- Mechanized Peacekeeper
  [136470] = olive, -- Refreshment Vendor
  [136643] = magenta, -- Azerite Extractor

  -- Priory of the Sacred Flame

  [206696] = magenta, -- Arathi Knight
  [206697] = olive, -- Devout Priest
  [206698] = deepskyblue, -- Fanatical Conjuror
  [206699] = darkorange, -- War Lynx
  [206704] = magenta, -- Ardent Paladin
  [206710] = magenta, -- Lightspawn
  [207939] = mediumslateblue, -- Baron Braunpyke
  [207940] = olive, -- Prioress Murrpray
  [207946] = mediumslateblue, -- Captain Dailcry
  [207949] = magenta, -- Zealous Templar
  [211289] = olive, -- Taener Duelmal
  [211290] = magenta, -- Elaena Emberlanz
  [211291] = magenta, -- Sergeant Shaynemail
  [212826] = magenta, -- Guard Captain Suleyman
  [212827] = olive, -- High Priest Aemya
  [212831] = magenta, -- Forge Master Damian
  [217658] = magenta, -- Sir Braunpyke
  [221760] = deepskyblue, -- Risen Mage

  -- Operation Mechagon

  [144244] = mediumslateblue, -- The Platinum Pummeler
  [144246] = mediumslateblue, -- K.U.-J.0.
  [144248] = mediumslateblue, -- Head Machinist Sparkflux
  [144249] = mediumslateblue, -- Omega Buster
  [144293] = magenta, -- Waste Processing Unit
  [144294] = olive, -- Mechagon Tinkerer
  [144295] = rogue, -- Mechagon Mechanic
  [144296] = magenta, -- Spider Tank
  [144298] = magenta, -- Defense Bot Mk III
  [145185] = mediumslateblue, -- Gnomercy 4.U.
  [150143] = rogue, -- Scrapbone Grinder
  [150146] = olive, -- Scrapbone Shaman
  [150160] = rogue, -- Scrapbone Bully
  [150165] = deepskyblue, -- Slime Elemental
  [150168] = magenta, -- Toxic Monstrosity
  [150169] = olive, -- Toxic Lurker
  [150250] = deepskyblue, -- Pistonhead Blaster
  [150251] = deepskyblue, -- Pistonhead Mechanic
  [150276] = olive, -- Heavy Scrapbot
  [150292] = magenta, -- Mechagon Cavalry
  [150297] = olive, -- Mechagon Renormalizer
  [150396] = mediumslateblue, -- Aerial Unit R-21/X
  [151613] = deepskyblue, -- Anti-Personnel Squirrel
  [151649] = darkorange, -- Defense Bot Mk I
  [151657] = olive, -- Bomb Tonk
  [151773] = deepskyblue, -- Junkyard D.0.G.
  [152009] = "darkcyan", -- Malfunctioning Scrapbot
  [154758] = magenta, -- Toxic Monstrosity
  [155090] = olive, -- Anodized Coilbearer
  [236033] = darkorange, -- Metal Gunk

  -- Operation: Floodgate

  [226396] = mediumslateblue, -- Swampface
  [226398] = mediumslateblue, -- Big M.O.M.M.A.
  [226402] = mediumslateblue, -- Bront
  [226403] = mediumslateblue, -- Keeza Quickfuse
  [226404] = mediumslateblue, -- Geezle Gigazap
  [227145] = darkorange, -- Waterworks Crocolisk
  [228144] = darkorange, -- Darkfuse Soldier
  [228424] = olive, -- Darkfuse Mechadrone
  [229069] = deepskyblue, -- Mechadrone Sniper
  [229212] = deepskyblue, -- Darkfuse Demolitionist
  [229251] = magenta, -- Venture Co. Architect
  [229252] = rogue, -- Darkfuse Hyena
  [229686] = olive, -- Venture Co. Surveyor
  [230740] = magenta, -- Shreddinator 3000
  [230748] = magenta, -- Darkfuse Bloodwarper
  [231197] = magenta, -- Bubbles
  [231223] = deepskyblue, -- Disturbed Kelp
  [231312] = olive, -- Venture Co. Electrician
  [231325] = magenta, -- Darkfuse Jumpstarter
  [231380] = olive, -- Undercrawler
  [231496] = olive, -- Venture Co. Diver
  [236982] = darkorange, -- Darkfuse Soldier

  -- Darkflame Cleft

  [208450] = magenta, -- Wandering Candle
  [208456] = olive, -- Shuffling Horror
  [208743] = mediumslateblue, -- Blazikon
  [208745] = olive, -- The Candle King
  [208747] = mediumslateblue, -- The Darkness
  [210153] = mediumslateblue, -- Ol' Waxbeard
  [210539] = magenta, -- Corridor Creeper
  [210812] = olive, -- Royal Wicklighter
  [210818] = deepskyblue, -- Lowly Moleherd
  [211121] = magenta, -- Rank Overseer
  [211228] = olive, -- Blazing Fiend
  [211977] = rogue, -- Pack Mole
  [212411] = magenta, -- Torchsnarl
  [212412] = darkorange, -- Sootsnout
  [213913] = olive, -- Kobold Flametender
  [220815] = olive, -- Blazing Fiend
  [223770] = olive, -- Blazing Fiend
  [223772] = olive, -- Blazing Fiend
  [223773] = olive, -- Blazing Fiend
  [223774] = olive, -- Blazing Fiend
  [223775] = olive, -- Blazing Fiend
  [223776] = olive, -- Blazing Fiend
  [223777] = olive, -- Blazing Fiend
  [233152] = magenta, -- Wandering Candle

  -- Cinderbrew Meadery

  [210264] = deepskyblue, -- Bee Wrangler
  [210265] = darkorange, -- Worker Bee
  [210267] = mediumslateblue, -- I'pa
  [210269] = magenta, -- Hired Muscle
  [210271] = mediumslateblue, -- Brew Master Aldryr
  [214661] = mediumslateblue, -- Goldie Baronbottom
  [214673] = deepskyblue, -- Flavor Scientist
  [214697] = magenta, -- Chef Chewie
  [218002] = mediumslateblue, -- Benk Buzzbee
  [218016] = darkorange, -- Ravenous Cinderbee
  [218671] = darkorange, -- Venture Co. Pyromaniac
  [219301] = deepskyblue, -- Brew Drop
  [220060] = olive, -- Taste Tester
  [220141] = olive, -- Royal Jelly Purveyor
  [220368] = darkorange, -- Failed Batch
  [220946] = magenta, -- Venture Co. Honey Harvester
  [222964] = deepskyblue, -- Flavor Scientist
  [223423] = magenta, -- Careless Hopgoblin
  [223497] = darkorange, -- Worker Bee
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

  size = { 180, 20 },
  point = { "CENTER" },
  scale = 1 * L.C.globalscale,

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
      size = 12,
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

    size = 22,
    point = { "BOTTOMRIGHT", "TOPRIGHT", 0, 20 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "BOTTOMRIGHT",
    growthX = "LEFT",
    growthY = "UP",
    disableMouse = true,
    disableCooldown = true,
    filter = "HELPFUL|INCLUDE_NAME_PLATE_ONLY",

    FilterAura = FilterAuraBuffs,

    duration = {
      point = { "TOP", 0, 5 },
      font = L.C.font,
      size = 11,
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

    size = 22,
    point = { "BOTTOMLEFT", "TOPLEFT", 0, 20 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "UP",
    disableMouse = true,
    disableCooldown = true,
    filter = "HARMFUL|PLAYER|INCLUDE_NAME_PLATE_ONLY",

    FilterAura = FilterAuraDebuffs,

    duration = {
      point = { "TOP", 0, 5 },
      font = L.C.font,
      size = 11,
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
