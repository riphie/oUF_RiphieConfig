local A, L = ...

L.C.boss = {
  enabled = true,

  size = { 150, 25 },
  point = { "CENTER", UIParent, "CENTER", 500, 99.5 },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorReaction = false,
    colorClass = true,
    colorHealth = true,
    frequentUpdates = true,

    name = {
      enabled = true,
      size = 12,
      points = {
        { "LEFT", 5, 0 },
        { "RIGHT", -5, 0 },
      },
      align = "LEFT",
      tag = "[name]",
      noshadow = true,
    },
  },

  powerbar = {
    enabled = true,
    size = { 150, 3 },
    point = { "TOP", "BOTTOM", 0, -1 },
    colorPower = true,
  },

  raidicon = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },

  castbar = {
    enabled = false,
    size = { 130, 20 },
    point = { "TOP", "BOTTOM", 0, -14 },

    name = {
      enabled = true,
      size = 12,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      noshadow = true,
    },

    icon = {
      enabled = true,
      size = { 26, 26 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },
  },

  debuffs = {
    enabled = false,
    size = 22,
    point = { "LEFT", "RIGHT", 0, 0 },
    num = 5,
    cols = 5,
    spacing = 5,
    initialAnchor = "LEFT",
    growthX = "RIGHT",
    growthY = "DOWN",
    disableCooldown = false,
    onlyShowPlayer = true,
  },

  setup = {
    point = "TOP",
    relativePoint = "BOTTOM",
    xOffset = 0,
    yOffset = -25,
  },
}

SlashCmdList["TESTBOSS"] = function()
  oUF_RiphieBoss1:Show()
  oUF_RiphieBoss1.Hide = function() end
  oUF_RiphieBoss1.unit = "player"
  oUF_RiphieBoss2:Show()
  oUF_RiphieBoss2.Hide = function() end
  oUF_RiphieBoss2.unit = "player"
  oUF_RiphieBoss3:Show()
  oUF_RiphieBoss3.Hide = function() end
  oUF_RiphieBoss3.unit = "player"
  oUF_RiphieBoss4:Show()
  oUF_RiphieBoss4.Hide = function() end
  oUF_RiphieBoss4.unit = "player"
  oUF_RiphieBoss5:Show()
  oUF_RiphieBoss5.Hide = function() end
  oUF_RiphieBoss5.unit = "player"
end
SLASH_TESTBOSS1 = "/testboss"
