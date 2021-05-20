 -------------------------  correctRotation  v1.3  --------------------------
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
  
  sleep(0.1)
  gma.feedback("MATCH")  
    
  sleep(0.02)
  rotX = gma.show.property.get(handle,'RotX')
  sleep(0.02)
  rotY = gma.show.property.get(handle,'RotY')
  sleep(0.02)
  rotZ = gma.show.property.get(handle,'RotZ')  
  sleep(0.02)
  gma.feedback("old X: " .. rotX .. " Y: " .. rotY .. " Z: " .. rotZ)
  newRotX = rotX + modRotX    
  newRotY = rotY
  newRotZ = rotZ
  gma.feedback("mod X: " .. modRotX .. " Y: " .. modRotY .. " Z: " .. modRotZ)
  gma.feedback("new X: " .. newRotX .. " Y: " .. newRotY .. " Z: " .. newRotZ)
  if newRotX > 180 then
    newRotX = newRotX - 360
  elseif newRotX < -180 then
    newRotX = newRotX + 360
  end    
  gma.feedback("cor X: " .. newRotX .. " Y: " .. newRotY .. " Z: " .. newRotZ)
  cmd('Clear All')
  sleep(0.02)
  cmd('Fixture ' .. fixId)
  sleep(0.02)
  cmd('Rotate3D At ' .. newRotX .. ' ' .. newRotY .. ' ' .. newRotZ)
  sleep(0.02)
  cmd('Clear All')
  sleep(0.1)    
        
  rotX = gma.show.property.get(handle,'RotX')
  sleep(0.02)
  rotY = gma.show.property.get(handle,'RotY')
  sleep(0.02)
  rotZ = gma.show.property.get(handle,'RotZ')  
  sleep(0.02)
  gma.feedback("old X: " .. rotX .. " Y: " .. rotY .. " Z: " .. rotZ)
  newRotX = rotX  
  newRotY = rotY + modRotY 
  newRotZ = rotZ
  gma.feedback("mod X: " .. modRotX .. " Y: " .. modRotY .. " Z: " .. modRotZ)
  gma.feedback("new X: " .. newRotX .. " Y: " .. newRotY .. " Z: " .. newRotZ) 
  if newRotY > 180 then
    newRotY = newRotY - 360
  elseif newRotY < -180 then
    newRotY = newRotY + 360
  end  
  gma.feedback("cor X: " .. newRotX .. " Y: " .. newRotY .. " Z: " .. newRotZ)
  cmd('Clear All')
  sleep(0.02)
  cmd('Fixture ' .. fixId)
  sleep(0.02)
  cmd('Rotate3D At ' .. newRotX .. ' ' .. newRotY .. ' ' .. newRotZ)
  sleep(0.02)
  cmd('Clear All')
  sleep(0.1)    
    
  rotX = gma.show.property.get(handle,'RotX')
  sleep(0.02)
  rotY = gma.show.property.get(handle,'RotY')
  sleep(0.02)
  rotZ = gma.show.property.get(handle,'RotZ')  
  sleep(0.02)
  gma.feedback("old X: " .. rotX .. " Y: " .. rotY .. " Z: " .. rotZ)
  newRotX = rotX  
  newRotY = rotY
  newRotZ = rotZ + modRotZ
  gma.feedback("mod X: " .. modRotX .. " Y: " .. modRotY .. " Z: " .. modRotZ)
  gma.feedback("new X: " .. newRotX .. " Y: " .. newRotY .. " Z: " .. newRotZ)       
  if newRotZ > 180 then
    newRotZ = newRotZ - 360
  elseif newRotZ < -180 then
    newRotZ = newRotZ + 360
  end    
  gma.feedback("cor X: " .. newRotX .. " Y: " .. newRotY .. " Z: " .. newRotZ)
  cmd('Clear All')
  sleep(0.02)
  cmd('Fixture ' .. fixId)
  sleep(0.02)
  cmd('Rotate3D At ' .. newRotX .. ' ' .. newRotY .. ' ' .. newRotZ)
  sleep(0.02)
  cmd('Clear All')
  sleep(0.1)    
   
end

else
gma.feedback("no fixture")
end

end

end
return correctRotation;
