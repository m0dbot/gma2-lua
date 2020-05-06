--divideBPM v01
--martin [at] klangbild [dot] lighting

--divides your bpm thru your groups

function divideBPM()
  local getvar = gma.user.getvar
  local setvar = gma.user.setvar
  local gmasleep = gma.sleep (0.1)
  local oldBPM 
  local divi 
  local newBPM
  
  oldBPM = getvar("LS_D_BPM");
  divi = getvar("LS_DIV");
  
  setvar("LS_D_BPM_DIV" , oldBPM / divi );
  gmasleep();
end
return divideBPM;
