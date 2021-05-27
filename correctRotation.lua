 -------------------------  correctRotation  v1.4  --------------------------
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
  
  sleep(0.05)
  gma.feedback("MATCH")  
    
  sleep(0.05)
  rotX = gma.show.property.get(handle,'RotX')
  sleep(0.05)
  gma.feedback("old X: " .. rotX)
  newRotX = rotX + modRotX    
  gma.feedback("mod X: " .. modRotX)
  gma.feedback("new X: " .. newRotX)
  if newRotX > 180 then
    newRotX = newRotX - 360
  elseif newRotX < -180 then
    newRotX = newRotX + 360
  end    
  gma.feedback("cor X: " .. newRotX)
  cmd('Clear All')
  sleep(0.05)
  cmd('Assign Fixture '..fixId..'.1 /RotX='..newRotX)
  sleep(0.05)
  cmd('Clear All')
  sleep(0.05)    
        
  rotY = gma.show.property.get(handle,'RotY')
  sleep(0.05)
  gma.feedback("old Y: " .. rotY)
  newRotY = rotY + modRotY    
  gma.feedback("mod Y: " .. modRotY)
  gma.feedback("new Y: " .. newRotY)
  if newRotY > 180 then
    newRotY = newRotY - 360
  elseif newRotY < -180 then
    newRotY = newRotY + 360
  end    
  gma.feedback("cor Y: " .. newRotY)
  sleep(0.05)
  cmd('Assign Fixture '..fixId..'.1 /RotY='..newRotY)
  sleep(0.05)
  cmd('Clear All')
  sleep(0.05)    
  
  rotZ = gma.show.property.get(handle,'RotZ')
  sleep(0.05)
  gma.feedback("old Z: " .. rotZ)
  newRotZ = rotZ + modRotZ    
  gma.feedback("mod Z: " .. modRotZ)
  gma.feedback("new Z: " .. newRotZ)
  if newRotZ > 180 then
    newRotZ = newRotZ - 360
  elseif newRotZ < -180 then
    newRotZ = newRotZ + 360
  end    
  gma.feedback("cor Z: " .. newRotZ)
  sleep(0.05)
  cmd('Assign Fixture '..fixId..'.1 /RotZ='..newRotZ)
  sleep(0.05)
  cmd('Clear All')
  sleep(0.05)    
end

else
gma.feedback("no fixture")
end

end

end
return correctRotation;
