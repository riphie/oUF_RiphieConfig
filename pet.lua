local A, L = ...

L.C.pet = {
  enabled = true,

  size = { 80, 26 },
  point = { "TOPLEFT", "oUF_RiphiePlayer", "BOTTOMLEFT", 0, -10 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorReaction = false,
    colorClass = true,
    colorHealth = true,
    colorThreat = false,

    name = {
      enabled = true,
      size = 12,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      align = "CENTER",
      tag = "[name]",
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
    size = { 80, 20 },
    point = { "TOP", "BOTTOM", 0, -5 },

    name = {
      enabled = true,
      size = 11,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
    },

    icon = {
      enabled = false,
      size = { 26, 26 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },
  },

  altpowerbar = {
    enabled = false,
    size = { 80, 5 },
    point = { "BOTTOMLEFT", "oUF_RiphiePlayer", "TOPLEFT", 0, 4 },
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
