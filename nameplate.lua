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

-- Borrowed from https://wago.io/Whiiskeyznpccolor

local priority = { 1, 0, 1, 1 } -- pink (high prio / interrupts)
local secondary = { 0, 0.74902, 1, 1 } -- baby blue (secondary prio / interrupts)
local tertiary = { 0, 0, 1, 1 } -- blue (tertiary prio / casters)
local highHP = { 0.576471, 0.439216, 0.858824, 1 } -- purple (high hp)
local seasonal = { 1, 0.843137, 0, 1 } -- gold (neutral / seasonal affix)
local least = { 0.78, 0.61, 0.43 } -- brown (low prio)

local NamePlateCustomUnits = {
  -- Mythic+ Affixes
  -- [174773] = important, -- Spiteful Shade

  -- Ara-kara, City of Echoes
  -- [213179] = highHP, -- Avanoxx
  -- [214840] = tertiary, -- Engorged Crawler
  -- [215405] = highHP, -- Anub'zekt
  -- [215407] = highHP, -- Ki'katal the Harvester
  -- [215826] = priority, -- Bloodworker
  -- [215968] = secondary, -- Black Blood
  -- [216293] = secondary, -- Trilling Attendant
  -- [216333] = tertiary, -- Bloodstained Assistant
  -- [216336] = least, -- Ravenous Crawler
  -- [216337] = least, -- Bloodworker
  -- [216338] = highHP, -- Hulking Bloodguard
  -- [216340] = priority, -- Sentry Stagshell
  -- [216341] = least, -- Jabbing Flyer
  -- [216363] = least, -- Reinforced Drone
  -- [216364] = secondary, -- Blood Overseer
  -- [216365] = least, -- Winged Carrier
  -- [216856] = priority, -- Black Blood
  -- [217039] = highHP, -- Nerubian Hauler
  -- [217531] = highHP, -- Ixin
  -- [217533] = highHP, -- Atik
  -- [218324] = highHP, -- Nakt
  -- [218961] = priority, -- Starved Crawler
  -- [223253] = secondary, -- Bloodstained Webmage
  -- [228015] = highHP, -- Hulking Bloodguard

  -- City of Threads
  -- [216320] = highHP, -- The Coaglamation
  -- [216326] = tertiary, -- Ascended Neophyte
  -- [216328] = highHP, -- Unstable Test Subject
  -- [216339] = secondary, -- Sureki Unnaturaler
  -- [216342] = priority, -- Skittering Assistant
  -- [216619] = highHP, -- Orator Krix'vizk
  -- [216648] = highHP, -- Nx
  -- [216649] = highHP, -- Vx
  -- [216658] = highHP, -- Izo, the Grand Splicer
  -- [219198] = secondary, -- Ravenous Scarab
  -- [219984] = highHP, -- Xeph'itik
  -- [220003] = highHP, -- Eye of the Queen
  -- [220065] = priority, -- Umbral Weave
  -- [220193] = tertiary, -- Sureki Venomblade
  -- [220195] = secondary, -- Sureki Silkbinder
  -- [220196] = highHP, -- Herald of Ansurek
  -- [220197] = highHP, -- Royal Swarmguard
  -- [220199] = least, -- Battle Scarab
  -- [220401] = least, -- Pale Priest
  -- [220423] = highHP, -- Retired Lord Vul'azak
  -- [220730] = highHP, -- Royal Venomshell
  -- [221102] = secondary, -- Elder Shadeweaver
  -- [221103] = highHP, -- Hulking Warshell
  -- [222700] = priority, -- Umbral Weave
  -- [222974] = least, -- Hungry Scarab
  -- [223181] = least, -- Agile Pursuer
  -- [223182] = secondary, -- Web Marauder
  -- [223357] = tertiary, -- Sureki Conscript
  -- [223646] = least, -- Pale Priest
  -- [223844] = priority, -- Covert Webmancer
  -- [224731] = secondary, -- Web Marauder
  -- [224732] = priority, -- Covert Webmancer

  -- Grim Batol
  -- [39388] = least, -- Mutated Hatchling
  -- [39392] = highHP, -- Faceless Corruptor
  -- [39625] = highHP, -- General Umbriss
  -- [40166] = highHP, -- Molten Giant
  -- [40167] = priority, -- Twilight Beguiler
  -- [40177] = highHP, -- Forgemaster Throngus
  -- [40319] = highHP, -- Drahga Shadowburner
  -- [40320] = highHP, -- Valiona
  -- [40357] = priority, -- Invoked Shadowflame Spirit
  -- [40484] = highHP, -- Erudax
  -- [224152] = tertiary, -- Twilight Brute
  -- [224219] = secondary, -- Twilight Earthcaller
  -- [224221] = priority, -- Twilight Overseer
  -- [224240] = tertiary, -- Twilight Decapitator
  -- [224249] = highHP, -- Twilight Lavabender
  -- [224271] = secondary, -- Twilight Warlock
  -- [224276] = highHP, -- Twilight Enforcer
  -- [224609] = highHP, -- Twilight Destroyer
  -- [224853] = least, -- Mutated Hatchling

  -- Mists of Tirna Scithe
  -- [163058] = tertiary, -- Mistveil Defender
  -- [164501] = highHP, -- Mistcaller
  -- [164517] = highHP, -- Tred'ova
  -- [164567] = secondary, -- Ingra Maloch
  -- [164804] = priority, -- Droman Oulfarran
  -- [164920] = priority, -- Drust Soulcleaver
  -- [164921] = secondary, -- Drust Harvester
  -- [164926] = highHP, -- Drust Boughbreaker
  -- [164929] = highHP, -- Tirnenn Villager
  -- [165108] = priority, -- Illusionary Clone
  -- [165251] = priority, -- Illusionary Vulpin
  -- [165560] = priority, -- Gormling Larva
  -- [166275] = secondary, -- Mistveil Shaper
  -- [166276] = highHP, -- Mistveil Guardian
  -- [166299] = priority, -- Mistveil Tender
  -- [167111] = priority, -- Spinemaw Staghorn
  -- [167113] = tertiary, -- Spinemaw Acidgullet
  -- [172312] = secondary, -- Spinemaw Gorger
  -- [173714] = highHP, -- Mistveil Nightblossom

  -- Siege of Boralus
  -- [128650] = highHP, -- Chopper Redhook
  -- [128651] = highHP, -- Hadal Darkfathom
  -- [128652] = highHP, -- Viq'Goth
  -- [128967] = secondary, -- Ashvane Sniper
  -- [128969] = highHP, -- Ashvane Commander
  -- [129208] = highHP, -- Dread Captain Lockwood
  -- [129366] = least, -- Bilge Rat Buccaneer
  -- [129367] = priority, -- Bilge Rat Tempest
  -- [129369] = highHP, -- Irontide Raider
  -- [129370] = secondary, -- Irontide Waveshaper
  -- [129371] = priority, -- Riptide Shredder
  -- [129372] = tertiary, -- Blacktar Bomber
  -- [129374] = highHP, -- Scrimshaw Enforcer
  -- [129640] = secondary, -- Snarling Dockhound
  -- [129879] = priority, -- Irontide Cleaver
  -- [129928] = secondary, -- Irontide Powdershot
  -- [133990] = least, -- Scrimshaw Gutter
  -- [135241] = least, -- Bilge Rat Pillager
  -- [135245] = highHP, -- Bilge Rat Demolisher
  -- [135258] = tertiary, -- Irontide Curseblade
  -- [135263] = secondary, -- Ashvane Spotter
  -- [136483] = tertiary, -- Ashvane Deckhand
  -- [136549] = secondary, -- Ashvane Cannoneer
  -- [137405] = priority, -- Gripping Terror
  -- [137511] = least, -- Bilge Rat Cutthroat
  -- [137516] = least, -- Ashvane Invader
  -- [137517] = tertiary, -- Ashvane Destroyer
  -- [137521] = least, -- Irontide Powdershot
  -- [137614] = secondary, -- Demolishing Terror
  -- [137625] = secondary, -- Demolishing Terror
  -- [137626] = secondary, -- Demolishing Terror
  -- [138002] = least, -- Scrimshaw Gutter
  -- [138247] = least, -- Irontide Curseblade
  -- [138254] = least, -- Irontide Powdershot
  -- [138255] = secondary, -- Ashvane Spotter
  -- [138464] = tertiary, -- Ashvane Deckhand
  -- [138465] = secondary, -- Ashvane Cannoneer
  -- [140447] = secondary, -- Demolishing Terror
  -- [141284] = seasonal, -- Kul Tiran Wavetender
  -- [141938] = secondary, -- Ashvane Sniper
  -- [144071] = seasonal, -- Irontide Waveshaper
  -- [144168] = tertiary, -- Ashvane Destroyer
  -- [144169] = highHP, -- Ashvane Commander
  -- [144170] = secondary, -- Ashvane Sniper

  -- The Dawnbreaker
  -- [210966] = secondary, -- Sureki Webmage
  -- [211087] = highHP, -- Speaker Shadowcrown
  -- [211089] = highHP, -- Anub'ikkaj
  -- [211261] = highHP, -- Ascendant Vis'coxria
  -- [211262] = secondary, -- Ixkreten the Unbreakable
  -- [211263] = highHP, -- Deathscreamer Iken'tak
  -- [211341] = secondary, -- Manifested Shadow
  -- [213885] = priority, -- Nightfall Dark Architect
  -- [213892] = secondary, -- Nightfall Shadowmage
  -- [213893] = priority, -- Nightfall Darkcaster
  -- [213894] = tertiary, -- Nightfall Curseblade
  -- [213895] = tertiary, -- Nightfall Shadowalker
  -- [213905] = least, -- Animated Darkness
  -- [213932] = secondary, -- Sureki Militant
  -- [213934] = tertiary, -- Nightfall Tactician
  -- [213937] = highHP, -- Rasha'nan
  -- [214761] = highHP, -- Nightfall Ritualist
  -- [214762] = secondary, -- Nightfall Commander
  -- [223994] = secondary, -- Nightfall Shadowmage
  -- [223995] = tertiary, -- Nightfall Curseblade
  -- [225479] = secondary, -- Sureki Webmage
  -- [225601] = least, -- Mereldar Citizen
  -- [225605] = priority, -- Nightfall Darkcaster
  -- [225606] = tertiary, -- Nightfall Shadowalker
  -- [228538] = tertiary, -- Nightfall Curseblade
  -- [228539] = secondary, -- Nightfall Darkcaster
  -- [229537] = priority, -- Void Emissary

  -- The Necrotic Wake
  -- [162691] = highHP, -- Blightbone
  -- [162693] = highHP, -- Nalthor the Rimebinder
  -- [162729] = least, -- Patchwerk Soldier
  -- [163121] = tertiary, -- Stitched Vanguard
  -- [163122] = least, -- Brittlebone Warrior
  -- [163126] = secondary, -- Brittlebone Mage
  -- [163128] = secondary, -- Zolramus Sorcerer
  -- [163157] = highHP, -- Amarth
  -- [163618] = priority, -- Zolramus Necromancer
  -- [163619] = tertiary, -- Zolramus Bonecarver
  -- [163620] = highHP, -- Rotspew
  -- [163621] = highHP, -- Goregrind
  -- [163622] = least, -- Goregrind Bits
  -- [164414] = secondary, -- Reanimated Mage
  -- [164427] = least, -- Reanimated Warrior
  -- [164578] = highHP, -- Stitchflesh's Creation
  -- [164702] = priority, -- Carrion Worm
  -- [165137] = highHP, -- Zolramus Gatekeeper
  -- [165138] = least, -- Blight Bag
  -- [165197] = highHP, -- Skeletal Monstrosity
  -- [165222] = priority, -- Zolramus Bonemender
  -- [165824] = priority, -- Nar'zudah
  -- [165872] = priority, -- Flesh Crafter
  -- [165911] = highHP, -- Loyal Creation
  -- [165919] = highHP, -- Skeletal Marauder
  -- [166079] = least, -- Brittlebone Crossbowman
  -- [166264] = least, -- Spare Parts
  -- [166266] = least, -- Spare Parts
  -- [166302] = secondary, -- Corpse Harvester
  -- [167731] = secondary, -- Separation Assistant
  -- [168246] = least, -- Reanimated Crossbowman
  -- [168384] = tertiary, -- Flesh Construct
  -- [168443] = priority, -- Zolramus Necromancer
  -- [171500] = least, -- Shuffling Corpse
  -- [172981] = highHP, -- Kyrian Stitchwerk
  -- [173016] = secondary, -- Corpse Collector
  -- [173044] = priority, -- Stitching Assistant

  -- The Stonevault
  -- [210108] = highHP, -- E.D.N.A
  -- [210109] = highHP, -- Earth Infused Golem
  -- [210156] = highHP, -- Skarmorak
  -- [212400] = highHP, -- Void Touched Elemental
  -- [212403] = secondary, -- Cursedheart Invader
  -- [212405] = least, -- Aspiring Forgehand
  -- [212453] = priority, -- Ghastly Voidsoul
  -- [212764] = least, -- Engine Speaker
  -- [212765] = secondary, -- Void Bound Despoiler
  -- [213119] = highHP, -- High Speaker Eirich
  -- [213216] = highHP, -- Speaker Dorlita
  -- [213217] = priority, -- Speaker Brokk
  -- [213338] = priority, -- Forgebound Mender
  -- [213343] = highHP, -- Forge Loader
  -- [213954] = highHP, -- Rock Smasher
  -- [214066] = secondary, -- Cursedforge Stoneshaper
  -- [214264] = tertiary, -- Cursedforge Honor Guard
  -- [214287] = priority, -- Earth Burst Totem
  -- [214350] = priority, -- Turned Speaker
  -- [214443] = priority, -- Crystal Shard
  -- [221979] = tertiary, -- Void Bound Howler
  -- [222923] = least, -- Repurposed Loaderbot
  -- [224516] = least, -- Skardyn Invader
  -- [224962] = priority, -- Cursedforge Mender
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
