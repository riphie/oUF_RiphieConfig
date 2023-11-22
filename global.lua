local A, L = ...

local LibStub = LibStub
local LSM = LibStub "LibSharedMedia-3.0"

L.C.globalscale = 1

L.C.backdrop = {
  bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
  bgColor = { 0, 0, 0, 0.8 },
  edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
  edgeColor = { 0, 0, 0, 0.8 },
  tile = false,
  tileSize = 0,
  inset = 1,
  edgeSize = 1,
  insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

L.C.font = LSM:Fetch("font", "Expressway")

L.C.textures = {
  statusbar = LSM:Fetch("statusbar", "SkullflowerGradient2"),
  statusbarBG = LSM:Fetch("statusbar", "SkullflowerGradient2"),

  absorb = LSM:Fetch("statusbar", "RiphieAbsorb"),
}

L.C.colors = {}

L.C.colors.bgMultiplier = 0.3

L.C.colors.healthbar = {
  default = { 0, 1, 0 },
  defaultBG = { 0 * L.C.colors.bgMultiplier, 1 * L.C.colors.bgMultiplier, 0 * L.C.colors.bgMultiplier },

  own = { 0, 1, 0, 0.5 },
  other = { 0, 1, 0.4, 0.5 },

  threat = { 1, 0, 0 },
  threatBG = { 1 * L.C.colors.bgMultiplier, 0 * L.C.colors.bgMultiplier, 0 * L.C.colors.bgMultiplier },

  threatInvers = { 0, 1, 0 },
  threatInversBG = { 0 * L.C.colors.bgMultiplier, 1 * L.C.colors.bgMultiplier, 0 * L.C.colors.bgMultiplier },

  absorb = { 0.1, 1, 1, 0.7 },
}

L.C.colors.castbar = {
  default = { 1, 0.7, 0 },
  defaultBG = { 1 * L.C.colors.bgMultiplier, 0.7 * L.C.colors.bgMultiplier, 0 * L.C.colors.bgMultiplier },

  shielded = { 0.9, 0.1, 0.4 },
  shieldedBG = { 0.9 * L.C.colors.bgMultiplier, 0.1 * L.C.colors.bgMultiplier, 0.4 * L.C.colors.bgMultiplier },
}

-- override oUF threat colouring
oUF.colors.threat[0] = { 0.1, 0.7, 0.9 }
oUF.colors.threat[1] = { 0.4, 0.1, 0.9 }
oUF.colors.threat[2] = { 0.9, 0.1, 0.9 }
oUF.colors.threat[3] = { 0.9, 0.1, 0.4 }

-- override oUF reaction colouring
oUF.colors.reaction[1] = { 1, 0.12, 0.25 }
oUF.colors.reaction[2] = { 1, 0.12, 0.25 }
oUF.colors.reaction[3] = { 1, 0.5, 0.25 }
oUF.colors.reaction[4] = { 1, 1, 0 }
oUF.colors.reaction[5] = { 0.26, 1, 0.22 }
oUF.colors.reaction[6] = { 0.26, 1, 0.22 }
oUF.colors.reaction[7] = { 0.26, 1, 0.22 }
oUF.colors.reaction[8] = { 0.26, 1, 0.22 }
