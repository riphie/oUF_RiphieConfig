local A, L = ...

L.C.boss = {
  enabled = true,

  size = { 150, 26.4 },
  point = { "CENTER", UIParent, "CENTER", 500, 100 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = false,
    colorReaction = false,
    colorClass = true,
    colorHealth = true,
    colorThreat = false,

    frequentUpdates = true,

    name = {
      enabled = true,
      points = {
        { "LEFT", 5, 0 },
        { "RIGHT", -5, 0 },
      },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[name]",
    },

    healthperc = {
      enabled = true,
      point = { "RIGHT", -5, 0 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
      tag = "[perhp]%",
    },
  },

  powerbar = {
    colorPower = true,

    enabled = true,
    size = { 150, 3 },
    point = { "TOP", "BOTTOM", 0, -1 },

    power = {
      enabled = false,
      point = { "LEFT", -2, 0 },
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
    size = { 130, 20 },
    point = { "LEFT", "RIGHT", 5.3, 0.1 },

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
      point = { "LEFT", "RIGHT", 6, 0 },
    },
  },

  debuffs = {
    enabled = true,

    size = 25,
    point = { "RIGHT", "LEFT", -5, 0.5 },
    num = 5,
    cols = 5,
    spacing = 5.5,
    initialAnchor = "RIGHT",
    growthX = "LEFT",
    growthY = "DOWN",
    disableCooldown = true,
    onlyShowPlayer = true,

    duration = {
      point = { "TOP", 0, 4 },
      font = L.C.font,
      size = 10,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
    },

    count = {
      point = { "BOTTOMRIGHT", 2, -2 },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "LEFT",
      noshadow = true,
    },
  },

  raidicon = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },

  setup = {
    point = "TOP",
    relativePoint = "BOTTOM",
    xOffset = 0,
    yOffset = -10.5,
  },
}

SlashCmdList["TESTBOSS"] = function()
  oUF_RiphieBoss1:Show()
  oUF_RiphieBoss1.Hide = function() end
  oUF_RiphieBoss1.unit = "focus"

  oUF_RiphieBoss2:Show()
  oUF_RiphieBoss2.Hide = function() end
  oUF_RiphieBoss2.unit = "focus"

  oUF_RiphieBoss3:Show()
  oUF_RiphieBoss3.Hide = function() end
  oUF_RiphieBoss3.unit = "focus"

  oUF_RiphieBoss4:Show()
  oUF_RiphieBoss4.Hide = function() end
  oUF_RiphieBoss4.unit = "focus"

  oUF_RiphieBoss5:Show()
  oUF_RiphieBoss5.Hide = function() end
  oUF_RiphieBoss5.unit = "focus"
end
SLASH_TESTBOSS1 = "/testboss"
