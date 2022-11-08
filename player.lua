local A, L = ...

L.C.player = {
  enabled = true,

  size = { 200, 18 },
  point = { "RIGHT", UIParent, "CENTER", -160, -300 },
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
      point = { "LEFT", 5, 8 },
      tag = "[oUF_Riphie:health]",
      noshadow = true,
    },

    healthperc = {
      enabled = true,
      size = 12,
      point = { "RIGHT", -5, 0 },
      tag = "[perhp]%",
      noshadow = true,
    },
  },

  powerbar = {
    colorPower = true,

    enabled = true,
    size = { 200, 3 },
    point = { "TOP", "BOTTOM", 0, -1 }, -- if no relativeTo is given the frame base will be the relativeTo reference

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
      enabled = false,
      size = { 20, 20 },
      point = { "RIGHT", "LEFT", -6, 0 },
    },

    safezone = {
      enabled = true,
    },
  },

  -- TODO: need to figure this out
  -- classbar = {
  --   enabled = true,
  --   size = { 22, 4 },
  --   point = { "BOTTOMRIGHT", "TOPRIGHT", 0, 3 },
  --
  --   splits = {
  --     enabled = true,
  --     texture = L.C.textures.split,
  --     size = { 5, 5 },
  --     color = { 0, 0, 0, 1 },
  --   },
  -- },

  -- TODO: need to figure this out
  -- altpowerbar = {
  --   enabled = false,
  --   size = { 130, 5 },
  --   point = { "BOTTOMLEFT", "TOPLEFT", 0, 4 },
  -- },
}
