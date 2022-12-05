local A, L = ...

L.C.mediapath = "interface\\addons\\" .. A .. "\\media\\"

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

L.C.textures = {
  statusbar = L.C.mediapath .. "Skullflower3",
  statusbarBG = L.C.mediapath .. "Skullflower3",
  absorb = L.C.mediapath .. "absorb",
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

  shielded = { 0.7, 0.7, 0.7 },
  shieldedBG = { 0.7 * L.C.colors.bgMultiplier, 0.7 * L.C.colors.bgMultiplier, 0.7 * L.C.colors.bgMultiplier },
}
