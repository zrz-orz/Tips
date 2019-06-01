#!/bin/lua

local HOME = os.getenv("HOME");
local hour = os.date("%H");
local minute = os.date("%M");
local Start = hour * 60 + minute;
print("Input hour:");
local Hour = io.read();
local Tmp = Hour * 1;
if (Tmp > 24 or Tmp < 0) then
  print("Error");
  os.exit();
end
print("Input minute:");
local Minute = io.read();
local Tmp = Tmp * 1;
if (Tmp > 60 or Tmp < 0) then
  print("Error");
  os.exit();
end
local End = Hour * 60 + Minute;
local Cost = End - Start;
if (Cost < 0) then
  print("Error");
  os.exit();
end
print(Cost);
print("Input event:");
local In = io.read();
local Script = HOME .. "/.Tips_script/" .. In .. ".bash";
File = io.open(Script, "w+");
local content = [[
#!/bin/bash

sleep TIMEm
zenity --info --text "INPUT"
rm nohup.out

]]
content = string.gsub(content, "TIME", Cost);
content = string.gsub(content, "INPUT", In);
File:write(content);
os.execute("nohup bash " .. Script .. " &");
os.execute("clear");
print("Ready .. ");
