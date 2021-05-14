 -------------------------  correctRotation  v0.42  --------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 -----------------------------------------------------------------------------
 -----------------------------------------------------------------------------
 

function correctRotation()


local FirstFixture = 001                 -- first fixture to modify
local LastFixture  = 199                 -- last fixture to mofify


local cmd    =  gma.cmd 
local sleep   =  gma.sleep
local fixId
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


for fixId = FirstFixture, LastFixture do


gma.feedback("reading fixture " .. fixId)

if(gma.show.getobj.handle("Fixture " .. fixId .. ".1"))then

local handle  =  gma.show.getobj.handle("Fixture " .. fixId .. ".1")

local fixName = gma.show.property.get(handle,3)
gma.feedback('FixtureType is ' .. fixName)
found = 1

if string.match(fixName, "Dimmer 00") then
   modRotX = 0
   modRotY = -90
   modRotZ = 0
  
elseif string.match(fixName, "Pointe Mode 3") then
   modRotX = 0
   modRotY = 45
   modRotZ = 0  
  
elseif string.match(fixName, "GDID0001") then
   modRotX = 0
   modRotY = 0
   modRotZ = 180  
  
elseif string.match(fixName, "GDID0002") then
   modRotX = 90
   modRotY = -45
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

  cmd('Fixture ' .. fixId)
  sleep(0.1)
  cmd('Rotate3D At ' .. newRotX .. ' ' .. newRotY .. ' ' .. newRotZ)
  sleep(0.1)

end

end

end

end
return correctRotation;
