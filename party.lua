local A, L = ...

local function FilterAuraDebuffs(element, unit, data)
  return L.C.BossDebuffAllowList[data.spellId]
end

L.C.party = {
  enabled = true,

  size = { 150, 25 },
  point = { "CENTER", "UIParent", "CENTER", -450, 0 },
  scale = 1 * L.C.globalscale,

  range = { insideAlpha = 1, outsideAlpha = 0.6 },

  healthbar = {
    colorDisconnected = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,
    colorThreat = true,

    name = {
      enabled = true,
      points = {
        { "LEFT", 5, 0 },
        { "RIGHT", 5, 0 },
      },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_RiphieConfig:name]",
    },

    health = {
      enabled = false,
      point = { "RIGHT", -2, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_Riphie:health]",
    },

    healthperc = {
      enabled = false,
      point = { "LEFT", 5, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[perhp]%",
    },
  },

  powerbar = {
    colorPower = true,

    enabled = false,
    size = { 180, 5 },
    point = { "TOP", "BOTTOM", 0, -1 },

    power = {
      enabled = false,
      point = { "LEFT", -2, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[perpp]",
    },
  },

  castbar = {
    enabled = false,
    size = { 150, 20 },
    point = { "LEFT", "RIGHT", 6, 0 },

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
      enabled = false,
      size = { 26, 26 },
      point = { "LEFT", "RIGHT", 5, 0 },
    },
  },

  debuffs = {
    enabled = false,

    size = 25,
    point = { "LEFT", "RIGHT", 5, 0 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "DOWN",
    disableCooldown = true,

    FilterAuras = FilterAuraDebuffs,

    duration = {
      point = { "TOP", 0, 4 },
      font = L.C.font,
      size = 10,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
    },

    count = {
      point = { "BOTTOMRIGHT", 2, -2 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
    },
  },

  readycheck = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "RIGHT", 0, 0 },
  },

  raidicon = {
    enabled = true,
    size = { 15, 15 },
    point = { "CENTER", "RIGHT", -12, 0 },
  },

  setup = {
    template = nil,
    visibility = "custom [group:party,nogroup:raid] show; hide",
    showPlayer = false,
    showSolo = false,
    showParty = true,
    showRaid = false,
    point = "TOP",
    xOffset = 0,
    yOffset = -5,
  },
}
