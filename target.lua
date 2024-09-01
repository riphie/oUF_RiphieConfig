local _, L = ...

L.C.target = {
  enabled = true,

  size = { 200, 28 },
  point = { "LEFT", "UIParent", "CENTER", 200, -175 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,
    colorThreat = true,

    absorb = {
      enabled = true,
    },

    name = {
      enabled = true,
      points = {
        { "TOPLEFT", 0, 10 },
        { "TOPRIGHT", 0, 10 },
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
      point = { "RIGHT", -5, 0 },
      font = L.C.font,
      size = 15,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_Riphie:health]",
    },

    healthperc = {
      enabled = true,
      point = { "LEFT", 5, 0 },
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
    size = { 200, 3 },
    point = { "TOP", "BOTTOM", 0, -1 },

    power = {
      enabled = false,
    },
  },

  castbar = {
    enabled = true,
    size = { 200, 24 },
    point = { "TOP", "BOTTOM", 0, -7 },

    name = {
      enabled = true,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      font = L.C.font,
      size = 13,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
    },

    time = {
      enabled = false,
    },

    icon = {
      enabled = false,
    },
  },

  buffs = {
    enabled = true,
    size = 23,
    point = { "BOTTOMLEFT", "RIGHT", 5, 5 },

    num = 40,
    cols = 8,
    spacing = 5,
    initialAnchor = "BOTTOMLEFT",
    growthX = "RIGHT",
    growthY = "UP",
    disableCooldown = true,

    duration = {
      point = { "TOP", 0, 0 },
      font = L.C.font,
      size = 11,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },

    count = {
      point = { "BOTTOMRIGHT", 2, -2 },
      font = L.C.font,
      size = 13,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },
  },

  debuffs = {
    enabled = true,
    size = 23,
    point = { "TOPLEFT", "RIGHT", 5, -5 },

    num = 40,
    cols = 8,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "DOWN",
    disableCooldown = true,
    onlyShowPlayer = true,

    duration = {
      point = { "TOP", 0, 0 },
      font = L.C.font,
      size = 11,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },

    count = {
      point = { "BOTTOMRIGHT", 2, -2 },
      font = L.C.font,
      size = 13,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },
  },

  raidicon = {
    enabled = false,
  },
}
