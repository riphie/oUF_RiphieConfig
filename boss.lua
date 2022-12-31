local A, L = ...

L.C.boss = {
  enabled = true,

  size = { 130, 20 },
  point = { "CENTER", UIParent, "CENTER", 450, 300 },
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
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      align = "CENTER",
      tag = "[name]",
      noshadow = true,
    },
  },

  powerbar = {
    enabled = true,
    size = { 130, 3 },
    point = { "TOP", "BOTTOM", 0, -1 },
    colorPower = true,
  },

  raidicon = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },

  castbar = {
    enabled = true,
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
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "DOWN",
    disableCooldown = false,
    onlyShowPlayer = true,
  },

  setup = {
    point = "TOP",
    relativePoint = "BOTTOM",
    xOffset = 0,
    yOffset = -40,
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
end
SLASH_TESTBOSS1 = "/testboss"
