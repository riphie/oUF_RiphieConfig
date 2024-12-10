local _, L = ...

local function FilterAuraDebuffs(_, _, data)
  return L.C.PartyDebuffAllowList[data.spellId]
end

L.C.party = {
  enabled = true,

  size = { 200, 34 },
  point = { "CENTER", "UIParent", "CENTER", -525, 34 },
  scale = 1 * L.C.globalscale,

  range = { insideAlpha = 1, outsideAlpha = 0.6 },

  healthbar = {
    colorDisconnected = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,
    colorThreat = true,

    frequentUpdates = true,

    absorb = {
      enabled = true,
    },

    name = {
      enabled = true,
      points = {
        { "LEFT", 5, 0 },
        { "RIGHT", 5, 0 },
      },
      font = L.C.font,
      size = 14,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_RiphieConfig:name]",
    },

    health = {
      enabled = false,
    },

    healthperc = {
      enabled = false,
    },
  },

  powerbar = {
    colorPower = true,

    enabled = true,
    size = { 200, 3 },
    point = { "TOP", "BOTTOM", 0, -1 },

    power = {
      enabled = false,
    },
  },

  castbar = {
    enabled = false,
  },

  debuffs = {
    enabled = false,

    -- size = 25,
    -- point = { "LEFT", "RIGHT", 5, 0 },
    -- num = 5,
    -- cols = 5,
    -- spacing = 5,
    -- initialAnchor = "TOPLEFT",
    -- growthX = "RIGHT",
    -- growthY = "DOWN",
    -- disableCooldown = true,

    FilterAura = FilterAuraDebuffs,

    -- duration = {
    --   point = { "TOP", 0, 4 },
    --   font = L.C.font,
    --   size = 10,
    --   outline = "OUTLINE",
    --   align = "LEFT",
    --   noshadow = true,
    -- },

    -- count = {
    --   point = { "BOTTOMRIGHT", 2, -2 },
    --   font = L.C.font,
    --   size = 12,
    --   outline = "OUTLINE",
    --   align = "LEFT",
    --   noshadow = true,
    -- },
  },

  grouproleindicator = {
    enabled = true,
    size = { 12, 12 },
    point = { "TOPRIGHT", -2, -2 },
  },

  readycheck = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "RIGHT", 0, 0 },
  },

  raidicon = {
    enabled = true,
    size = { 12, 12 },
    point = { "BOTTOMRIGHT", -3, 3 },
  },

  summonindicator = {
    enabled = true,
    size = { 20, 20 },
    point = { "CENTER", "CENTER", 0, 0 },
  },

  setup = {
    template = nil,
    visibility = "custom [group:party,nogroup:raid] show; hide",
    showPlayer = false,
    showSolo = false,
    showParty = true,
    showRaid = false,
    point = "TOP",
    relativePoint = "BOTTOM",
    xOffset = 0,
    yOffset = -10,
  },
}
