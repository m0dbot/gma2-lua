 --------------------------  correctRotation  v0.4  --------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 -----------------------------------------------------------------------------
 -----------------------------------------------------------------------------
 

function correctRotation()

local startFix = 1               -- first fixture to modify
local endFix = 99                 -- last fixture to mofify

local getvar = gma.user.getvar    -- gma.user.setvar or gma.system.getvar
local cmd    =  gma.cmd 
local FixId
local rotX
local rotY
local rotZ
local newRotX
local newRotY
local newRotZ
local nodRotX
local modRotY
local modRotZ
local found

FixId = getvar("LS_READFIXID")


gma.feedback("reading fixture " .. FixId)
local handle  =  gma.show.getobj.handle("Fixture " .. FixId .. ".1")
local fixName = gma.show.property.get(handle,3)
gma.feedback('FixtureType is ' .. fixName)
found = 1

if string.match(fixName, "Pointe Mode 3") then
   modRotX = 0
   modRotY = 90
   modRotZ = 180
  
elseif string.match(fixName, "Dimmer 00") then
   modRotX = 0
   modRotY = 0
   modRotZ = 90  
  
elseif string.match(fixName, "GDID0001") then
   modRotX = 0
   modRotY = 0
   modRotZ = 180  
  
elseif string.match(fixName, "GDID0002") then
   modRotX = 90
   modRotY = 0
   modRotZ = 0


else
  found = 0
  gma.feedback("NO MATCH")
end

if found == 1 then

  gma.feedback("MATCH")

  rotX = gma.show.property.get(handle,'RotX')
  rotY = gma.show.property.get(handle,'RotY')
  rotZ = gma.show.property.get(handle,'RotZ')
  
  
  gma.feedback("X: " .. rotX .. " Y: " .. rotY .. " Z: " .. rotZ)

  newRotX = rotX + modRotX
  newRotY = rotY + modRotY
  newRotZ = rotZ + modRotZ
  
  
  gma.feedback("mod X: " .. modRotX .. " Y: " .. modRotY .. " Z: " .. modRotZ)
  gma.feedback("new X: " .. newRotX .. " Y: " .. newRotY .. " Z: " .. newRotZ)
  
  if newRotX > 180 then
    newRotX = newRotX - 360
  elseif newRotX < -180 then
    newRotX = newRotX + 360
  end  
  if newRotY > 180 then
    newRotY = newRotY - 360
  elseif newRotY < -180 then
    newRotY = newRotY + 360
  end  
  if newRotZ > 180 then
    newRotZ = newRotZ - 360
  elseif newRotZ < -180 then
    newRotZ = newRotZ + 360
  end	
  

  gma.feedback("cor X: " .. newRotX .. " Y: " .. newRotY .. " Z: " .. newRotZ)

  cmd('Fixture ' .. FixId)
  --gma.sleep 0.01
  cmd('Rotate3D At ' .. newRotX .. ' ' .. newRotY .. ' ' .. newRotZ)
  --gma.sleep 0.01

end

end
return correctRotation;
