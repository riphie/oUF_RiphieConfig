local _, L = ...

local NamePlateBuffAllowList = {}
L.C.NamePlateBuffAllowList = NamePlateBuffAllowList

local NamePlateDebuffAllowList = {
  ["DEATH_KNIGHT"] = false,
  ["DEMONHUNTER"] = {
    [179057] = true, -- Chaos Nova
    [204490] = true, -- Sigil of Silence
    [204598] = true, -- Sigil of Flame
    [207685] = true, -- Sigil of Misery
    [207771] = true, -- Fiery Brand
    [247456] = true, -- Frailty
  },
  ["DRUID"] = false,
  ["EVOKER"] = false,
  ["HUNTER"] = false,
  ["MAGE"] = false,
  ["MONK"] = false,
  ["PALADIN"] = false,
  ["PRIEST"] = false,
  ["SHAMAN"] = {
    [188389] = true, -- Flame Shock
    [334168] = true, -- Lashing Flames
  },
  ["ROGUE"] = {
    [408] = true, -- Kidney Shot
    [1833] = true, -- Cheap Shot
    [1943] = true, -- Rupture
    [2094] = true, -- Blind
  },
  ["WARLOCK"] = {
    [30283] = true, -- Shadowfury
    [423583] = true, -- Doom Brand
  },
  ["WARRIOR"] = {
    [355] = true, -- Taunt
    [1160] = true, -- Demoralizing Shout
    [132168] = true, -- Shockwave
    [132169] = true, -- Storm Bolt
    [397364] = true, -- Thunderous Roar
  },
}
L.C.NamePlateDebuffAllowList = NamePlateDebuffAllowList

local BossDebuffAllowList = {
  ["DEATH_KNIGHT"] = false,
  ["DEMONHUNTER"] = {
    [1490] = true, -- Chaos Brand
  },
  ["DRUID"] = false,
  ["EVOKER"] = false,
  ["HUNTER"] = false,
  ["MAGE"] = false,
  ["MONK"] = false,
  ["PALADIN"] = false,
  ["PRIEST"] = false,
  ["SHAMAN"] = {
    [188389] = true, -- Flame Shock
    [334168] = true, -- Lashing Flames
  },
  ["ROGUE"] = {
    [1943] = true, -- Rupture
  },
  ["WARLOCK"] = false,
  ["WARRIOR"] = false,
}
L.C.BossDebuffAllowList = BossDebuffAllowList

local PartyDebuffAllowList = {
  [240443] = true, -- Burst
}
L.C.PartyDebuffAllowList = PartyDebuffAllowList
