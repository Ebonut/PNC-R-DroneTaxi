write("Input coordinates: \n x \n y \n z \n")
x = read()
y = read()
z = read()
print("Getting coords...")
x1,y1,z1 = gps.locate()
a = {x1,y1,z1}
print(a)
if a ~= nil then
rednet.open("back")
p = tostring(math.random(-65535,65535))
s = rednet.send(10,{a,{x,y,z},p}, "taxi")
print("Request sent, waiting for answer...")
s = rednet.receive(p,10)
sleep(1)
if s ~= nil then
print("Success! A drone will soon pick you up. Press <enter> to confirm arrival")
read()
rednet.send(10,0,p)
else
printError("Didn't get a server reply, an error occured. Contact drakonmark12345 to help out.")
end
else
printError("Couldn't get your coordinates. Try contacting your GPS provider or try again later.")
end
