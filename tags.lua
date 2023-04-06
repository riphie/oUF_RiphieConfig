local A, L = ...

L.C.tagMethods["oUF_RiphieConfig:status"] = function(unit, ...)
  if UnitAffectingCombat(unit) then
    return "|TInterface\\CharacterFrame\\UI-StateIcon:20:20:0:0:64:64:33:64:0:31|t"
  elseif unit == "player" and IsResting() then
    return "|TInterface\\CharacterFrame\\UI-StateIcon:20:20:0:0:64:64:0:31:0:31|t"
  end
end
L.C.tagEvents["oUF_RiphieConfig:status"] = "PLAYER_REGEN_DISABLED PLAYER_REGEN_ENABLED PLAYER_UPDATE_RESTING"

L.C.tagMethods["oUF_RiphieConfig:name"] = function(unit, ...)
  local name = UnitName(unit)
  local class = UnitClassification(unit)

  name = ShortenString(name, 15, "...")

  if class == "elite" then
    return name .. " ++"
  elseif class == "rare" or class == "rareelite" then
    return name .. " +"
  else
    return name
  end
end
L.C.tagEvents["oUF_RiphieConfig:name"] = "UNIT_NAME_UPDATE"

function ShortenString(str, numChars, dots)
  local bytes = #str
  if bytes <= numChars then
    return str
  else
    local len, pos = 0, 1
    while pos <= bytes do
      len = len + 1
      local c = str:byte(pos)
      if c > 0 and c <= 127 then
        pos = pos + 1
      elseif c >= 192 and c <= 223 then
        pos = pos + 2
      elseif c >= 224 and c <= 239 then
        pos = pos + 3
      elseif c >= 240 and c <= 247 then
        pos = pos + 4
      end
      if len == numChars then
        break
      end
    end

    if len == numChars and pos <= bytes then
      return strsub(str, 1, pos - 1) .. (dots and "..." or "")
    else
      return str
    end
  end
end
