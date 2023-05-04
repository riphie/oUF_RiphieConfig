local A, L = ...

L.C.focus = {
  enabled = true,

  -- TODO: consider resize/reposition
  size = { 150, 20 },
  point = { "RIGHT", UIParent, "CENTER", -210, -308 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,
    colorThreat = true,

    frequentUpdates = true,

    name = {
      enabled = true,
      size = 12,
      points = {
        { "TOPLEFT", 0, 18 },
        { "TOPRIGHT", 0, 18 },
      },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_RiphieConfig:name]",
    },

    health = {
      enabled = true,
      point = { "LEFT", 5, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[oUF_Riphie:health]",
    },

    healthperc = {
      enabled = true,
      size = 12,
      point = { "RIGHT", -5, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[perhp]%",
    },
  },

  absorbbar = {
    enabled = true,
  },

  powerbar = {
    colorPower = true,

    enabled = true,
    size = { 150, 3 },
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
    size = { 150, 20 },
    -- TODO: update Y position due to powerbar enabled
    point = { "TOP", "BOTTOM", 0, -6 },

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
      size = { 26, 26 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },
  },

  raidicon = {
    enabled = false,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },
}
