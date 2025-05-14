d = peripheral.find("pneumaticcraft:drone_interface")
rednet.open(peripheral.getName(peripheral.find("modem")))
while true do
print("Waiting for orders...")
id, a = rednet.receive("taxi")
print("Order recieved, sending confirmation!")
rednet.send(id,0,a[3])
pos1 = a[1]
pos1R = pos1
pos2 = a[2]
for i,v in ipairs(pos2) do
pos2[i] = tonumber(v)
end
for i,v in ipairs(pos1) do
m = v-5
pos1[i] = m
end
for i,v in ipairs(pos1R) do
m = v+5
pos1R[i] = m
end
print("Sending the drone to user's coordinates...")
d.clearArea()
d.addArea(pos1[1],pos1[2],pos1[3],pos1R[1],pos1R[2],pos1R[3],"filled")
d.setAction("teleport")
repeat
sleep(0.01) until d.isActionDone()
print("Picking the user up and waiting for confirmation...")
d.abortAction()
d.setAction("entity_import")
rednet.receive(a[3],20)
print("Confirmation received, getting the user to their destination...")
d.clearArea()
d.abortAction()
d.addArea(pos2[1],pos2[2],pos2[3])
d.setAction("entity_export")
sleep(10)
d.exitPiece()
print("Done!")
end




