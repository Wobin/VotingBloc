--[[
Title: Voting Bloc
Author: Wobin
Date: 08/04/2023
Repository: https://github.com/Wobin/VotingBloc
Version: 2.2
]]--
local mod = get_mod("Voting Bloc")
local OPTIONS = table.enum("yes", "no")
local allowNextVote = false
local current_vote = nil

mod:command(mod:localize("allow_next_vote_command"), "", function()
    allowNextVote = true
    mod:echo(mod:localize("allowing_the_next_vote"))
  end)


mod.showVote = function(self, voting_id, template, params)
  local my_peer_id = Network.peer_id()
  if not Managers.voting:has_voted(voting_id, my_peer_id) then
			local peer_id = params.kick_peer_id
      local players_at_peer = Managers.player:players_at_peer(peer_id)
      local player_name = "John Doe"

      if players_at_peer then
        local player = players_at_peer[1]
        player_name = player:name()
      else
        local human_players = Managers.player:human_players()
        player_name = "John Doe"
      end          
      mod:notify(mod:localize("vote_message_start") .. player_name .. mod:localize("vote_message_end"))
      mod:echo(mod:localize("vote_message_start") .. player_name .. mod:localize("vote_message_end"))
      current_vote = voting_id
  end
end

mod.voting_yes = function(self)  
  if current_vote and not Managers.voting:has_voted(current_vote, Network.peer_id()) then
    Managers.voting:cast_vote(current_vote, OPTIONS.yes)    
    mod:echo(mod:localize("casted_yes_vote"))
    current_vote = nil
  end
end

mod.voting_no = function(self)  
  if current_vote and not Managers.voting:has_voted(current_vote, Network.peer_id()) then
    Managers.voting:cast_vote(current_vote, OPTIONS.no)          
    mod:echo(mod:localize("casted_no_vote"))
    current_vote = nil
  end
end

mod:hook_require("scripts/settings/voting/voting_templates/kick_from_mission_voting_template", function(template)        
    mod:hook(template, "on_started", function(func, voting_id, template, params)
        if not mod:get("cast_vote") == "on" then
          if not allowNextVote then
            Managers.voting:cast_vote(voting_id, mod:get("always_vote"))          
          else          
            allowNextVote = false
          end        
          func(voting_id, template, params)
        else
          mod:showVote(voting_id, template, params)
        end
      end)
  end)