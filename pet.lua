local A, L = ...

L.C.pet = {
  enabled = true,

  size = { 80, 20 },
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
      enabled = true,
      size = { 26, 26 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },
  },
}
