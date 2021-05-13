 ---------------------------- getNextFreeSeq v1.0 ----------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 -------- Script to set uservar nextFreeSeq to the next free sequence --------
 -- nextFreeSeq will be set to zero if nothing is free in the defined range --
 -----------------------------------------------------------------------------
 
local input = gma.textinput;
local grab  = gma.show.getobj;
local getvar = gma.user.getvar;
local setvar = gma.user.setvar;
local gmasleep = gma.sleep (0.1);
local echo    =  gma.echo;
  
  oldBPM = getvar("LS_D_BPM");
  divi = getvar("LS_DIV");
  
  setvar("LS_D_BPM_DIV" , oldBPM / divi );
  gmasleep();
 
function getRotation()
 local FixId = getvar("LS_ReadFixId"); 
	local rotX = gma.show.property.get(FixId,18);
	local rotY = gma.show.property.get(FixId,19);
	local rotZ = gma.show.property.get(FixId,20);
 echo('rotX : '..rotX' rotY : '..rotY' rotZ : '..rotZ);
 
end
