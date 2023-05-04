local A, L = ...

L.C.raid = {
  enabled = true,

  size = { 80, 20 },
  points = {
    { "TOPLEFT", 20, -20 },
    { "TOP", "oUF_RiphieRaidHeader1", "BOTTOM", 0, -10 },
    { "TOP", "oUF_RiphieRaidHeader2", "BOTTOM", 0, -10 },
    { "TOP", "oUF_RiphieRaidHeader3", "BOTTOM", 0, -10 },
    { "LEFT", "oUF_RiphieRaidHeader1", "RIGHT", 10, 0 },
    { "TOP", "oUF_RiphieRaidHeader5", "BOTTOM", 0, -10 },
    { "TOP", "oUF_RiphieRaidHeader6", "BOTTOM", 0, -10 },
    { "TOP", "oUF_RiphieRaidHeader7", "BOTTOM", 0, -10 },
  },
  scale = 1 * L.C.globalscale,

  healthbar = {
    colorDisconnected = true,
    colorReaction = true,
    colorClass = true,
    colorHealth = true,
    colorThreat = true,

    name = {
      enabled = true,
      points = {
        { "LEFT", 2, 0 },
        { "RIGHT", -2, 0 },
      },
      font = L.C.font,
      size = 12,
      outline = "OUTLINE",
      align = "CENTER",
      noshadow = true,
      tag = "[name]",
    },
  },

  readycheck = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "RIGHT", 0, 0 },
  },

  raidicon = {
    enabled = true,
    size = { 18, 18 },
    point = { "CENTER", "LEFT", 0, 0 },
  },

  setup = {
    template = nil,
    -- visibility = "custom [group:raid] show; hide",
    showPlayer = true,
    showSolo = true,
    showParty = false,
    showRaid = true,
    point = "TOP",
    xOffset = 0,
    yOffset = -5,
  },
}
