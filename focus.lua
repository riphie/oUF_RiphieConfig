local A, L = ...

L.C.focus = {
  enabled = true,

  size = { 180, 30 },
  point = { "CENTER", UIParent, "CENTER", -500, 0 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorTapping = true,
    colorDisconnected = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,
    colorThreat = true,

    name = {
      enabled = true,
      size = 12,
      points = {
        { "TOPLEFT", 2, 15 },
        { "TOPRIGHT", -2, 15 },
      },
      tag = "[name]",
      noshadow = true,
    },

    health = {
      enabled = true,
      size = 23,
      point = { "LEFT", 5, 0 },
      tag = "[oUF_Riphie:health]",
      noshadow = true,
    },
  },

  raidicon = {
    enabled = false,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },

  castbar = {
    enabled = true,
    size = { 180, 20 },
    point = { "TOP", "BOTTOM", 0, -5 },

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

  debuffs = {
    enabled = false,
    size = 22,
    point = { "TOPLEFT", "BOTTOMLEFT", 0, -5 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "DOWN",
    disableCooldown = true,
  },
}
