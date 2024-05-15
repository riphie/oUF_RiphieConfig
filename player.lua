local _, L = ...

L.C.player = {
  enabled = true,

  size = { 180, 26 },
  point = { "RIGHT", "UIParent", "CENTER", -200, -174 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = false,
    colorReaction = false,
    colorClass = true,
    colorHealth = false,
    colorThreat = false,

    absorb = {
      enabled = true,
    },

    name = {
      enabled = true,
      point = { "CENTER", 0, 0 },
      font = L.C.font,
      size = 10,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_RiphieConfig:status]",
    },

    health = {
      enabled = true,
      point = { "LEFT", 5, 0 },
      font = L.C.font,
      size = 15,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_Riphie:health]",
    },

    healthperc = {
      enabled = true,
      point = { "RIGHT", -5, 0 },
      font = L.C.font,
      size = 15,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[perhp]%",
    },
  },

  powerbar = {
    colorPower = true,

    enabled = false,
    size = { 180, 3 },
    point = { "TOP", "BOTTOM", 0, -1 },

    power = {
      enabled = false,
      point = { "RIGHT", -2, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[perpp]",
    },
  },

  castbar = {
    enabled = true,
    size = { 220, 20 },
    point = { "CENTER", "UIParent", "CENTER", 0, -300 },

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

    time = {
      enabled = false,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "RIGHT",
      noshadow = true,
    },

    icon = {
      enabled = false,
      size = { 20, 20 },
      point = { "RIGHT", "LEFT", -5, 0 },
    },

    safezone = {
      enabled = false,
    },
  },

  raidicon = {
    enabled = false,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },
}
