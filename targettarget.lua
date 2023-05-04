local A, L = ...

L.C.targettarget = {
  enabled = true,

  size = { 60, 20 },
  point = { "BOTTOMRIGHT", "oUF_RiphieTarget", "TOPRIGHT", 0, 5 },
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
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      align = "CENTER",
      tag = "[name]",
      noshadow = true,
    },
  },
}
