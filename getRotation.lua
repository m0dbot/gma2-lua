 ----------------------------  getRotation  v1.0  ----------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 --  Script to set uservars LS_rotX,LS_rotZ,LS_rotZ to the current patched  --
 --  rotation of a fixture defined by uservar LS_ReadFixId                  --
 -----------------------------------------------------------------------------
 
local input = gma.textinput;
local grab  = gma.show.getobj;
local getvar = gma.user.getvar;
local setvar = gma.user.setvar;
local gmasleep = gma.sleep (0.1);
local echo    =  gma.echo;
  

 
function getRotation()
 local FixId = getvar("LS_ReadFixId"); 
 local rotX = gma.show.property.get(FixId,18);
 local rotY = gma.show.property.get(FixId,19);
 local rotZ = gma.show.property.get(FixId,20);
 echo('rotX : '..rotX' rotY : '..rotY' rotZ : '..rotZ);
 gmasleep();
 setvar("LS_rotX" , rotX );
end
