local _, L = ...

local NamePlateBuffAllowList = {}
L.C.NamePlateBuffAllowList = NamePlateBuffAllowList

local NamePlateDebuffAllowList = {
  ["DEATHKNIGHT"] = false,
  ["DEMONHUNTER"] = {
    [179057] = true, -- Chaos Nova
    [204490] = true, -- Sigil of Silence
    [204598] = true, -- Sigil of Flame
    [207685] = true, -- Sigil of Misery
    [207771] = true, -- Fiery Brand
  },
  ["DRUID"] = {
    [164812] = true, -- Moonfire
    [192090] = true, -- Trash
  },
  ["EVOKER"] = false,
  ["HUNTER"] = false,
  ["MAGE"] = false,
  ["MONK"] = false,
  ["PALADIN"] = {},
  ["PRIEST"] = false,
  ["SHAMAN"] = {
    [188389] = true, -- Flame Shock
    [334168] = true, -- Lashing Flames
  },
  ["ROGUE"] = {
    [408] = true, -- Kidney Shot
    [703] = true, -- Garrote
    [1833] = true, -- Cheap Shot
    [1943] = true, -- Rupture
    [2094] = true, -- Blind
    [121411] = true, -- Crimson Tempest
  },
  ["WARLOCK"] = {
    [30283] = true, -- Shadowfury
    [423583] = true, -- Doom Brand
  },
  ["WARRIOR"] = {
    [132168] = true, -- Shockwave
    [132169] = true, -- Storm Bolt
    [388539] = true, -- Rend
  },
}
L.C.NamePlateDebuffAllowList = NamePlateDebuffAllowList

local BossDebuffAllowList = {
  ["DEATHKNIGHT"] = false,
  ["DEMONHUNTER"] = {
    [1490] = true, -- Chaos Brand
  },
  ["DRUID"] = {
    [164812] = true, -- Moonfire
    [192090] = true, -- Trash
  },
  ["EVOKER"] = false,
  ["HUNTER"] = false,
  ["MAGE"] = false,
  ["MONK"] = false,
  ["PALADIN"] = {},
  ["PRIEST"] = false,
  ["SHAMAN"] = {
    [188389] = true, -- Flame Shock
    [334168] = true, -- Lashing Flames
  },
  ["ROGUE"] = {
    [703] = true, -- Garrote
    [1943] = true, -- Rupture
  },
  ["WARLOCK"] = false,
  ["WARRIOR"] = {
    [388539] = true, -- Rend
  },
}
L.C.BossDebuffAllowList = BossDebuffAllowList

local PartyDebuffAllowList = {
  -- TODO: add Sated
}
L.C.PartyDebuffAllowList = PartyDebuffAllowList
