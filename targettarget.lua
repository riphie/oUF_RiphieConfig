local A, L = ...

L.C.targettarget = {
  enabled = true,

  size = { 80, 25 },
  point = { "TOPRIGHT", "oUF_RiphieTarget", "BOTTOMRIGHT", 0, -10 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = true,
    colorReaction = false,
    colorClass = true,
    colorHealth = true,

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
