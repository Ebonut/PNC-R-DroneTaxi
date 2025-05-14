a=...
SERVERID=10 -- Change it to your own
print("Getting coords...")
x1,y1,z1 = gps.locate()
print(a)
function waitForConfirmation()
read()
end
function timeout()
sleep(20)
error("Didn't get your confirmation till timeout, run again to retry!")
end
if a ~= nil then
rednet.open("back")
p = tostring(math.random(-65535,65535))
s = rednet.send(SERVERID,{a,{x,y,z},p}, "taxi")
print("Request sent, waiting for answer...")
s = rednet.receive(p,10)
if s ~= nil then
print("Success! A drone will soon pick you up. Press <enter> to confirm arrival")
parralel.waitForAny(waitForConfirmation,timeout)
rednet.send(SERVERID,0,p)
else
printError("Didn't get a server reply, an error occured. Contact the owner to help out.")
end
else
printError("Couldn't get your coordinates. Try contacting your GPS provider or try again later.")
end
