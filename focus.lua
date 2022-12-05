local A, L = ...

L.C.focus = {
  enabled = true,

  size = { 150, 30 },
  point = { "CENTER", UIParent, "CENTER", -700, 0 },
  scale = 1 * L.C.globalscale,

  healthbar = {
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
      size = 22,
      point = { "LEFT", 5, 0 },
      tag = "[oUF_Riphie:health]",
      noshadow = true,
    },

    healthperc = {
      enabled = true,
      size = 13,
      point = { "RIGHT", -5, 0 },
      tag = "[perhp]%",
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
    size = { 150, 20 },
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
      enabled = true,
      size = { 26, 26 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },
  },
}
