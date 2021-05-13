 ----------------------------  getRotation  v1.0  ----------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 --  Script to set uservars LS_rotX,LS_rotZ,LS_rotZ to the current patched  --
 --  rotation of a fixture defined by uservar LS_ReadFixId                  --
 -----------------------------------------------------------------------------
 


 
function getRotation()
gma.feedback("1");
local grab  = gma.show.getobj
local getvar = gma.user.getvar
local setvar = gma.user.setvar
local gmasleep = gma.sleep (0.1)  
local FixId = 0
local rotX = 1000
local rotY = 1000
local rotZ = 1000 
FixId = getvar("LS_READFIXID")
handle = gma.show.getobj.handle('fixture 'FixId);
rotX = gma.show.property.get(handle,18);
rotY = gma.show.property.get(handle,19);
rotZ = gma.show.property.get(handle,20); 
gma.feedback("rotX : " .. rotX .. " rotY : " .. rotY .. " rotZ : " .. rotZ);
gmasleep();
setvar("LS_ROTX" , rotX);
setvar("LS_ROTY" , rotY);
setvar("LS_ROTZ" , rotZ);
end
return getRotation;
