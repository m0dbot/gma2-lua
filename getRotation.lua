 ---------------------------- getNextFreeSeq v1.0 ----------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 -------- Script to set uservar nextFreeSeq to the next free sequence --------
 -- nextFreeSeq will be set to zero if nothing is free in the defined range --
 -----------------------------------------------------------------------------
 
local sleep = gma.sleep;    
local cmd   = gma.cmd;
local input = gma.textinput;
local grab  = gma.show.getobj;
local name = grab.name;
local text = gma.textinput
local sgetvar = gma.show.getvar;
local echo    =  gma.echo;
 
function getRotation()
local startSeq = 3000               -- first sequence to check
local endSeq = 3990                 -- last sequence to check
local setvar = gma.user.setvar      -- gma.user.setvar or gma.system.setvar
local gmasleep = gma.sleep (0.1)
local nextFreeSeq = 0 -- don't change
  for i = startSeq, endSeq do 
    if (gma.show.getobj.handle ("seq " .. i)) then 
    else 
      nextFreeSeq = i;
      break;
    end
  end
  if (nextFreeSeq == 0) then
    gma.feedback("Error! No free sequences in defined range between " .. startSeq .. " and " .. endSeq);
  end
  setvar("nextFreeSeq" , nextFreeSeq);
  gmasleep();
end
return getNextFreeSeq;
