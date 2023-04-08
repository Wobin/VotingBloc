--[[
Title: Voting Bloc
Author: Wobin
Date: 08/04/2023
Repository: https://github.com/Wobin/VotingBloc
Version: 1.1
]]--
local mod = get_mod("Voting Bloc")

local allowNextVote = false
mod:command(mod:localize("allow_next_vote_command"), "", function()
    allowNextVote = true
    mod:echo(mod:localize("allowing_the_next_vote"))
    end)

mod:hook_require("scripts/settings/voting/voting_templates/kick_from_mission_voting_template", function(template)    
    mod:hook(template, "on_started", function(func, voting_id, template, params)
        if not allowNextVote then
          Managers.voting:cast_vote(voting_id, mod:get("always_vote"))          
        else          
          allowNextVote = false
        end        
        func(voting_id, template, params)
        end)
    end)