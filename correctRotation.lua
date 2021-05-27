 -------------------------  correctRotation  v1.6  --------------------------
 --                   martin [at] klangbild [dot] lighting                  --

 -----------------------------------------------------------------------------
 -----------------------------------------------------------------------------
 

function correctRotation()

local FirstFixture = 001                 -- first fixture to modify
local LastFixture  = 199                 -- last fixture to mofify

local cmd    =  gma.cmd 
local sleep   =  gma.sleep
local fixId
local nodRotX
local modRotY
local modRotZ
local found


sleep(0.1)
cmd('Clear All')
sleep(0.1)
for fixId = FirstFixture, LastFixture do
gma.feedback("reading fixture " .. fixId)
if(gma.show.getobj.handle("Fixture " .. fixId .. ".1"))then
sleep(0.1)
local handle  =  gma.show.getobj.handle("Fixture " .. fixId .. ".1")
sleep(0.1)
local fixName = gma.show.property.get(handle,3)
gma.feedback('FixtureType is ' .. fixName)
found = 1
if string.match(fixName, "GD0001") then
   modRotX = 0
   modRotY = -90
   modRotZ = 0
     
  --copy these lines and change for your needs--
elseif string.match(fixName, "GD0002") then
   modRotX = 0
   modRotY = 45
   modRotZ = 0  
  
  --copy these lines and change for your needs--
elseif string.match(fixName, "GD0003") then
   modRotX = 0
   modRotY = 0
   modRotZ = 180  
  
  --copy these lines and change for your needs--
elseif string.match(fixName, "GD0004") then
   modRotX = 90
   modRotY = -45
   modRotZ = 0


else
  found = 0
  gma.feedback("NO MATCH")
end
   
if found == 1 then  
  sleep(0.1)
  gma.feedback("MATCH")  
  sleep(0.1)
  cmd('Fixture ' .. fixId)
  sleep(0.1)
  cmd('Rotate3D At ' .. modRotX .. ' ' .. modRotY .. ' ' .. modRotZ .. ' /relative')
  sleep(0.1)
  cmd('Clear All')
  sleep(0.1)    
end

else
gma.feedback("no fixture")
end

end

end
return correctRotation;
