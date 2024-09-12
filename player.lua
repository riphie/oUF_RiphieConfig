local _, L = ...

L.C.player = {
  enabled = true,

  size = { 220, 32 },
  point = { "RIGHT", "UIParent", "CENTER", -200, -222 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorClass = true,

    absorb = {
      enabled = true,
    },

    name = {
      enabled = true,
      point = { "CENTER", 0, 0 },
      font = L.C.font,
      size = 13,
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
    enabled = false,
  },

  castbar = {
    enabled = true,
    size = { 220, 24 },
    point = { "CENTER", "UIParent", "CENTER", 0, -320 },

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
    },

    icon = {
      enabled = false,
    },

    safezone = {
      enabled = false,
    },
  },

  buffs = {
    enabled = true,
    size = 32,
    point = { "TOPRIGHT", "UIParent", "TOPRIGHT", -200, -25 },

    num = 40,
    cols = 11,
    spacing = 5,
    initialAnchor = "TOPRIGHT",
    growthX = "LEFT",
    growthY = "DOWN",
    spacingX = 5,
    spacingY = 10,

    disableCooldown = true,

    duration = {
      point = { "BOTTOM", 0, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },

    count = {
      point = { "BOTTOMRIGHT", 0, 8 },
      font = L.C.font,
      size = 13,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },
  },

  debuffs = {
    enabled = true,
    size = 38,
    point = { "TOPRIGHT", "UIParent", "TOPRIGHT", -200, -180 },

    num = 40,
    cols = 11,
    spacing = 5,
    initialAnchor = "TOPRIGHT",
    growthX = "LEFT",
    growthY = "DOWN",
    spacingX = 5,
    spacingY = 10,

    disableCooldown = true,
    onlyShowPlayer = false,

    duration = {
      point = { "BOTTOM", 0, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
    },

    count = {
      point = { "BOTTOMRIGHT", 0, 8 },
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
