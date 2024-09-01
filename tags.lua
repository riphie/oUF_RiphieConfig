local _, L = ...

local NameAliases = {}
L.C.NameAliases = NameAliases

L.C.tagMethods["oUF_RiphieConfig:status"] = function(unit)
  if UnitAffectingCombat(unit) then
    return "|TInterface\\CharacterFrame\\UI-StateIcon:20:20:0:0:64:64:33:64:0:31|t"
  elseif unit == "player" and IsResting() then
    return "|TInterface\\CharacterFrame\\UI-StateIcon:20:20:0:0:64:64:0:31:0:31|t"
  end
end
L.C.tagEvents["oUF_RiphieConfig:status"] = "PLAYER_REGEN_DISABLED PLAYER_REGEN_ENABLED PLAYER_UPDATE_RESTING"

L.C.tagMethods["oUF_RiphieConfig:name"] = function(unit)
  local name = UnitName(unit)

  if L.C.NameAliases[name] then
    name = L.C.NameAliases[name]
  end

  return name
end
L.C.tagEvents["oUF_RiphieConfig:name"] = "UNIT_NAME_UPDATE"

L.C.tagMethods["oUF_RiphieConfig:shortname"] = function(unit)
  local name = UnitName(unit)
  local class = UnitClassification(unit)

  if L.C.NameAliases[name] then
    name = L.C.NameAliases[name]
  end

  name = L.F.ShortenString(name, 14, "...")

  if class == "elite" then
    return name .. " ++"
  elseif class == "rare" or class == "rareelite" then
    return name .. " +"
  else
    return name
  end
end
L.C.tagEvents["oUF_RiphieConfig:shortname"] = "UNIT_NAME_UPDATE"
