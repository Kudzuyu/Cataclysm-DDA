function message(...)
  local s = string.format(...)
  game.add_msg(s)
end

function tri_delta(a, b)
  return tripoint(a.x - b.x, a.y - b.y, a.z - b.z)
end

function iuse_teleport(it, active)
  local save = it:get_var("teleport_save", "null")
  if save == "null" then
    message("位置が記憶されていません。")
    return 0
  end

  local omx = tonumber(it:get_var("teleport_omx", "0"))
  local omy = tonumber(it:get_var("teleport_omy", "0"))
  local omz = tonumber(it:get_var("teleport_omz", "0"))
  local gx = tonumber(it:get_var("teleport_gx", "0"))
  local gy = tonumber(it:get_var("teleport_gy", "0"))
  local gz = tonumber(it:get_var("teleport_gz", "0"))
  local om = tripoint(omx, omy, omz)
  local gpos = tripoint(gx, gy, gz)

  -- 近くにいるNPCを一緒に連れていく
  local npcs = {}
  local tmp_pos = player:pos()
  for dx = -10, 10 do
      for dy = -10, 10 do
          local npc_loc = tripoint(tmp_pos.x + dx, tmp_pos.y + dy, tmp_pos.z)
          local tmp_npc = game.get_npc_at(npc_loc)
          if tmp_npc then
              if tmp_npc:is_npc() then
                  table.insert(npcs, tmp_npc)
              end
          end
      end
  end
  
  g:place_player_overmap(om)
  local cur_gpos = player:global_square_location()
  local cur_pos = player:pos()

  -- player:pos()で取得できる座標はバッファ上の一時的な座標なので、
  -- global_square_locationで絶対座標を取得して補正する
  local delta = tri_delta(cur_gpos, gpos)
  player:setx(cur_pos.x - delta.x)
  player:sety(cur_pos.y - delta.y)
  player:setz(cur_pos.z - delta.z)

  -- NPCを再配置する
  tmp_pos = player:pos()
  for _,tmp_npc in ipairs(npcs) do
    for dx = -10, 10 do
        for dy = -10, 10 do
            local npc_loc = tripoint(tmp_pos.x + dx, tmp_pos.y + dy, tmp_pos.z)
            if not game.get_critter_at(npc_loc) then
                -- setposで座標を更新するとNPCが現在のovermapに現れる
                tmp_npc:setpos(npc_loc)
            end
        end
    end
  end
  g:reload_npcs()

  message("瞬間移動しました。")
  return 0
end

function iuse_teleport_save(it, active)
  local om = player:global_omt_location()
  local gpos = player:global_square_location()
  it:set_var("teleport_save", "saved")
  -- intで記憶するとなぜか読み出しが上手くいかないのでstringで記憶しておく
  it:set_var("teleport_omx", tostring(om.x))
  it:set_var("teleport_omy", tostring(om.y))
  it:set_var("teleport_omz", tostring(om.z))
  it:set_var("teleport_gx", tostring(gpos.x))
  it:set_var("teleport_gy", tostring(gpos.y))
  it:set_var("teleport_gz", tostring(gpos.z))

  message("位置を記憶しました。")
  message("Overmap (%d, %d, %d)", om.x, om.y, om.z)
  message("Global square (%d, %d, %d)", gpos.x, gpos.y, gpos.z)
end

game.register_iuse("IUSE_TELEPOTER", iuse_teleport)
game.register_iuse("IUSE_TELEPOTER_SAVE", iuse_teleport_save)
