 ----------------------------  getRotation  v1.1  ----------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 --  Script to set uservars LS_rotX,LS_rotY,LS_rotZ to the current patched  --
 --  rotation of a fixture defined by uservar LS_ReadFixId                  --
 -----------------------------------------------------------------------------
 --  v1.1 - now also prints out the fixture's long name into Ls_FIXNAME     --
 -----------------------------------------------------------------------------
 

function getRotation()

local getvar = gma.user.getvar
local setvar = gma.user.setvar
local FixId
local rotX
local rotY
local rotZ

FixId = getvar("LS_READFIXID");
gma.feedback("reading fixture " .. FixId)
local handle  =  gma.show.getobj.handle("Fixture " .. FixId .. ".1")
local fixName = gma.show.property.get(handle,3)
gma.feedback('FixtureType is '.. fixName)
rotX = gma.show.property.get(handle,'RotX')
rotY = gma.show.property.get(handle,'RotY')
rotZ = gma.show.property.get(handle,'RotZ') 
gma.feedback("X: " .. rotX .. " Y: " .. rotY .. " Z: " .. rotZ)
setvar("LS_ROTX" , rotX)
setvar("LS_ROTY" , rotY)
setvar("LS_ROTZ" , rotZ)
setvar("LS_FIXNAME" , fixName)
end
return getRotation
