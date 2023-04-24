--[[
Title: Voting Bloc
Author: Wobin
Date created: 08/04/2023
Date modified: 18/04/2023
Repository: https://github.com/Wobin/VotingBloc
Version: 3.1
]]--
local mod = get_mod("Voting Bloc")
local OPTIONS = table.enum("yes", "no")
local allowNextVote = false
local current_vote = nil
local SocialService = CLASS.SocialService
local social_service = Managers.data_service.social
local teamPanel = {}
local indexedParty = {}


local getIndexedParty = function()
    if teamPanel and teamPanel._player_panels_array then     
      indexedParty = {}
    for i = #teamPanel._player_panels_array, 1, -1 do      
      local panel = teamPanel._player_panels_array[i]
      if not panel.is_my_player then
        if panel.player:is_human_controlled() then
          table.insert(indexedParty, { is_valid = true, player = social_service:_get_player_info_for_player(panel.player)})          
        else
          table.insert(indexedParty, {is_valid = false, player = panel.player})          
        end
      end
    end
  end
  end

mod:command(mod:localize("initiate_vote_command"), mod:localize("initiate_vote_description"), function(target)    
  if social_service:is_in_mission() then  
    getIndexedParty()
    local targetPlayer = indexedParty[tonumber(target)]
    if targetPlayer then
      if targetPlayer.is_valid then
        local canKick, whyNot = social_service:can_kick_from_party(targetPlayer.player)
        if canKick then
          mod:echo(mod:localize("initiating_kick") .. targetPlayer.player:character_name())
          social_service:initiate_kick_vote(targetPlayer.player)
        elseif whyNot then
          mod:echo(Localize(whyNot))
        end
      else
        mod:echo(mod:localize("cannot_kick_bot") .. targetPlayer.player:name())
      end
    end
  end  
end)

mod:command(mod:localize("allow_next_vote_command"), "", function()
    allowNextVote = true
    mod:echo(mod:localize("allowing_the_next_vote"))
  end)

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

mod:hook_safe(CLASS.HudElementTeamPanelHandler,"update", function(self, ...)
    if teamPanel ~= self then      
      teamPanel = self
    end
end)

mod:hook_require("scripts/settings/voting/voting_templates/kick_from_mission_voting_template", function(template)        
    mod:hook_safe(template, "on_started", function(func, voting_id, template, params)
        if not mod:get("cast_vote") == "on" then
          if not allowNextVote then
            Managers.voting:cast_vote(voting_id, mod:get("always_vote"))          
          else          
            allowNextVote = false
          end                  
        else
          current_vote = voting_id
        end
      end)
  end)