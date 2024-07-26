local _, L = ...

L.C.targettarget = {
  enabled = true,

  size = { 60, 20 },
  point = { "BOTTOMRIGHT", "oUF_RiphieTarget", "TOPRIGHT", 0, 6 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,
    colorThreat = true,

    name = {
      enabled = true,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
      tag = "[name]",
    },
  },
}
