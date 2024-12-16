local _, L = ...

L.C.focus = {
  enabled = true,

  size = { 180, 28 },
  point = { "RIGHT", "UIParent", "CENTER", -200, -300 },
  scale = 1 * L.C.globalscale,

  range = { insideAlpha = 1, outsideAlpha = 0.6 },

  healthbar = {
    colorDisconnected = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,
    colorThreat = true,

    frequentUpdates = true,

    absorb = {
      enabled = true,
    },

    name = {
      enabled = true,
      points = {
        { "TOPLEFT", 0, 20 },
        { "TOPRIGHT", 0, 20 },
      },
      font = L.C.font,
      size = 14,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_RiphieConfig:shortname]",
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

    enabled = true,
    size = { 180, 2 },
    point = { "TOP", "BOTTOM", 0, -1 },

    power = {
      enabled = false,
    },
  },

  castbar = {
    enabled = true,
    size = { 180, 24 },
    point = { "TOP", "BOTTOM", 0, -7 },

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

  raidicon = {
    enabled = false,
  },
}
