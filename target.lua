local A, L = ...

L.C.target = {
  enabled = true,

  size = { 200, 20 },
  point = { "LEFT", UIParent, "CENTER", 160, -200 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = false,
    colorClass = true,
    colorReaction = false,
    colorHealth = true,
    colorThreat = false,
    colorThreatInvers = false,

    name = {
      enabled = true,
      size = 12,
      points = {
        { "TOPLEFT", 0, 25 },
        { "TOPRIGHT", 0, 25 },
      },
      tag = "[oUF_RiphieConfig:name]",
      noshadow = true,
    },

    health = {
      enabled = true,
      size = 23,
      point = { "RIGHT", -5, 8 },
      tag = "[oUF_Riphie:health]",
      noshadow = true,
    },

    healthperc = {
      enabled = true,
      size = 12,
      point = { "LEFT", 5, 0 },
      tag = "[perhp]%",
      noshadow = true,
    },
  },

  powerbar = {
    colorPower = true,

    enabled = true,
    size = { 200, 3 },
    point = { "TOP", "BOTTOM", 0, -1 },

    power = {
      enabled = false,
      size = 16,
      point = { "LEFT", -2, 0 },
      tag = "[perpp]",
    },
  },

  raidicon = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },

  castbar = {
    enabled = true,
    size = { 300, 20 },
    point = { "CENTER", UIParent, "CENTER", 0, 50 },

    name = {
      enabled = true,
      size = 12,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      noshadow = true,
    },

    icon = {
      enabled = false,
      size = { 26, 26 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },
  },

  buffs = {
    enabled = false,
    size = 22,
    point = { "BOTTOMLEFT", "RIGHT", 10, 5 },
    num = 40,
    cols = 8,
    spacing = 5,
    initialAnchor = "BOTTOMLEFT",
    growthX = "RIGHT",
    growthY = "UP",
    disableCooldown = true,
  },

  debuffs = {
    enabled = false,
    size = 22,
    point = { "TOPLEFT", "RIGHT", 10, -5 },
    num = 40,
    cols = 8,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "DOWN",
    disableCooldown = true,
  },
}
