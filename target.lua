local A, L = ...

L.C.target = {
  enabled = true,

  size = { 200, 30 },
  point = { "LEFT", UIParent, "CENTER", 160, -160 },
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
        { "TOPLEFT", 0, 18 },
        { "TOPRIGHT", 0, 18 },
      },
      tag = "[oUF_RiphieConfig:name]",
      noshadow = true,
    },

    health = {
      enabled = true,
      size = 18,
      point = { "RIGHT", -5, 0 },
      tag = "[oUF_Riphie:health]",
      noshadow = true,
    },

    healthperc = {
      enabled = true,
      size = 18,
      point = { "LEFT", 5, 0 },
      tag = "[perhp]%",
      noshadow = true,
    },
  },

  absorbbar = {
    enabled = true,
  },

  powerbar = {
    colorPower = true,

    enabled = true,
    size = { 200, 3 },
    point = { "TOP", "BOTTOM", 0, -0.5 },

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
    size = { 200, 20 },
    point = { "TOP", "BOTTOM", 0, -8 },

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
    enabled = true,
    size = 25,
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
    enabled = true,
    size = 25,
    point = { "TOPLEFT", "RIGHT", 8, -5 },
    num = 40,
    cols = 8,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "DOWN",
    disableCooldown = true,
    onlyShowPlayer = true,
  },
}
