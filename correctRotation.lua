 --------------------------  correctRotation  v0.1  --------------------------
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
local found = 1

FixId = getvar("LS_READFIXID")


gma.feedback("reading fixture " .. FixId)
local handle  =  gma.show.getobj.handle("Fixture " .. FixId .. ".1")
local fixName = gma.show.property.get(handle,3)
gma.feedback('FixtureType is '.. fixName)

if string.match(str, "Pointe Mode 3") then
  local modRotX = 0
  local modRotY = -90
  local modRotZ = 180
  
elseif string.match(str, "Dimmer 00") then
  local modRotX = 0
  local modRotY = 0
  local modRotZ = 90  
  
elseif string.match(str, "GDID0001") then
  local modRotX = 0
  local modRotY = 0
  local modRotZ = 180  
  
elseif string.match(str, "GDID0002") then
  local modRotX = -90
  local modRotY = 0
  local modRotZ = 0


else
  found = 0
  gma.feedback("NO MATCH")
end

if found == 1 then

  gma.feedback("MATCH")

  rotX = gma.show.property.get(handle,'RotX')
  rotY = gma.show.property.get(handle,'RotY')
  rotZ = gma.show.property.get(handle,'RotZ')

  newRotX = rotX + modRotX
  newRotY = rotY + modRotY
  newRotZ = rotZ + modRotZ

  cmd('Fixture ' .. FixId)
  gma.sleep 0.01
  cmd('Rotate3D At '..newRotZ..' '..newRotZ..' '..newRotZ)
  gma.sleep 0.01

end

end
return correctRotation;
