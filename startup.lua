d = peripheral.wrap("right")
rednet.open("top")
repeat
print("Cycle")
id, a = rednet.receive("taxi")
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
print(m)
end
print("")
for i,v in ipairs(pos1R) do
m = v+5
print(m)
pos1R[i] = m
end
d.clearArea()
d.addArea(pos1[1],pos1[2],pos1[3],pos1R[1],pos1R[2],pos1R[3],"filled")
print(textutils.tabulate(pos1))
print(textutils.tabulate(pos1R))
d.setAction("teleport")
repeat
sleep(0.01) until d.isActionDone()
d.abortAction()
d.setAction("entity_import")
rednet.receive(a[3],120)
d.clearArea()
d.abortAction()
d.addArea(pos2[1],pos2[2],pos2[3])
print("Second position:")
print(textutils.tabulate(pos2))
d.setAction("entity_export")
sleep(10)
d.exitPiece()
until false==true




