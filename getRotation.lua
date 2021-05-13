 ----------------------------  getRotation  v1.0  ----------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 --  Script to set uservars LS_rotX,LS_rotY,LS_rotZ to the current patched  --
 --  rotation of a fixture defined by uservar LS_ReadFixId                  --
 -----------------------------------------------------------------------------
 

function getRotation()

local getvar = gma.user.getvar
local setvar = gma.user.setvar
local FixId
local rotX
local rotY
local rotZ

FixId = getvar("LS_READFIXID");
gma.feedback("reading fixture " .. FixId);
local handle  =  gma.show.getobj.handle("Fixture " .. FixId);
gma.feedback('FixtureType is '.. gma.show.property.get(handle,3));
rotX = gma.show.property.get(handle,'RotX');
rotY = gma.show.property.get(handle,'RotY');
rotZ = gma.show.property.get(handle,'RotZ'); 
gma.feedback("X: " .. rotX .. " Y: " .. rotY .. " Z: " .. rotZ);
setvar("LS_ROTX" , rotX);
setvar("LS_ROTY" , rotY);
setvar("LS_ROTZ" , rotZ);
end
return getRotation;
