While analysing ac found a namecall detection in the dumped [CameraShaker] script

This detection looks very similar to a public detection that i've reversed before, the detection i'm talking about is a newproxy detection that abused getmetatable(proxy).__tostring combined with a pcall(getfenv) call and did a for int iteration just like BloxStrike's ac module is doing

e = function(r0) -- Line: 108 | Name: e
        local r1_0, r2_0, r3_0, r4_0, r5, r6_0, r7_0, r8_0, r9_0, r10_0, r11_0 = r0[3], r0[7], r0[5], r0[0], r0[8], r0[9], r0[4], r0[1], r0[2], r0[10], r0[6]
        return function() 
            pcall(function() 
                r4_0[1][r4_0[3]] = debug.info(2, "f")
            end)
            xpcall(function()
                r10_0[1][r10_0[3]] = debug.info(2, "f")
            end, function() 
            end)
            xpcall(function()
                game:WaitForChild({[setmetatable({}, {
    __tostring = function()
        for i_0 = 1, 15 do
            if not pcall(function()
                if getfenv(i_0).script ~= script then r9_0[1][r9_0[3]] = "Namecall Detected" end
            end) then
                break
            end
        end
    end,
    __metatable = "The metatable is locked"
end


This is a shell detection which working together with the __tostring detection, detects hooks. (Called under same xpcall)
              
end, function(r0)
          if r0 ~= "'__tostring' must return a string" then r9_0[1][r9_0[3]] = "Namecall Tampering #2" end
      end)
      local r4, r5_p171 = xpcall(function()
          local r0 = game:FakeIndex()
      end, function() 
          r3_0[1][r3_0[3]] = debug.info(2, "f")
      end)
      r11_0[1][r11_0[3]] = r4
      r7_0[1][r7_0[3]] = r5_p171
      local r2, r3 = pcall(r3_0[1][r3_0[3]])
      _ = r2
      r2_0[1][r2_0[3]] = r3
      local r4, r5_p171 = pcall(function()
          local r4, r5 = pcall(game.changed, "")
          r6_0[1][r6_0[3]] = r4
          r1_0[1][r1_0[3]] = r5
      end)
      r5[1][r5[3]] = r4
      r8_0[1][r8_0[3]] = r5_p171
  end
end,


This is the latest function i found in the AC module which seems to be a very common error message str num check, the only interesting part about this function is the argument passed in the pcall(r5_0)
A similar detection to this that i've bypassed before was implemented in Murderers vs Sheriffs

I currently don't know what the r5_0 temp var is referencing but i'll do some dbgconstant / dbgupvalue digging to figure it out, potentially hook pcall and check the argument through the hook.
                        
F = function(r0)
        local r1_0, r2_0, r3_0, r4_0, r5_0, r6 = r0[3], r0[2], r0[4], r0[5], r0[0], r0[1]
        return function() 
            r1_0[1][r1_0[3]](function()
                while true do
                    task.wait(1)
                    r2_0[1][r2_0[3]] = 0
                    r6[1][r6[3]] = 0
                    local r0, r1 = pcall(r5_0)
                    for r5 in string.gmatch(r1, r3_0) do
                        local r7, r8 = r6[1], r6[3]
                        r7[r8] += 1
                    end
                    if r2_0[1][r2_0[3]] ~= r6[1][r6[3]] then r4_0[1][r4_0[3]] = "Namecall Detected" end
                end
            end)
        end
    end,
