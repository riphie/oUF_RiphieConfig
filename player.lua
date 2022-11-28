local A, L = ...

L.C.player = {
  enabled = true,

  size = { 180, 30 },
  point = { "RIGHT", UIParent, "CENTER", -160, -200 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorClass = true,
    colorHealth = true,
    colorThreat = false,

    name = {
      enabled = false,
      size = 12,
      points = {
        { "TOPLEFT", 2, 10 },
        { "TOPRIGHT", -2, 10 },
      },
      tag = "[oUF_RiphieConfig:status]",
      noshadow = true,
    },

    health = {
      enabled = true,
      size = 23,
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

  powerbar = {
    colorPower = true,

    enabled = true,
    size = { 180, 3 },
    point = { "TOP", "BOTTOM", 0, -0.5 },

    power = {
      enabled = false,
      size = 16,
      point = { "RIGHT", -2, 0 },
      tag = "[perpp]",
    },
  },

  raidicon = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },

  castbar = {
    enabled = true,
    size = { 220, 20 },
    point = { "CENTER", UIParent, "CENTER", 0, -340 },

    name = {
      enabled = true,
      size = 12,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      noshadow = true,
    },

    time = {
      enabled = true,
      size = 12,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      align = "right",
      noshadow = true,
    },

    icon = {
      enabled = true,
      size = { 20, 20 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },

    safezone = {
      enabled = true,
    },
  },
}
