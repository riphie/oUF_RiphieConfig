local _, L = ...

L.C.pet = {
  enabled = true,

  size = { 80, 28 },
  point = { "RIGHT", "oUF_RiphiePlayer", "LEFT", -12, 0 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = false,
    colorReaction = false,
    colorClass = true,
    colorHealth = true,
    colorThreat = false,

    name = {
      enabled = true,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      font = L.C.font,
      size = 14,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
      tag = "[name]",
    },
  },

  castbar = {
    enabled = true,
    size = { 80, 20 },
    point = { "TOP", "BOTTOM", 0, -8 },

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
    },
  },
}
