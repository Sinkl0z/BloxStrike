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


This is a shell detection which working together with the __tostring detection, detects hooks.
              
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
