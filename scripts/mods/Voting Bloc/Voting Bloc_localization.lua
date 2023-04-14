-- Translators note: If you translate the allow_next_vote_command, please also put that translated command in the description translation

return {
	mod_description = {
		en = "When 'Automatically Vote' is set to on this mod will automatically vote on vote kicks, to prevent spamming of the team kick command. use /allowNextVote to permit a vote to be registered. Use /kick [1-3] to initate a vote kick on a player",
		["zh-cn"] = "启用“自动投票”时，此模组会自动投票踢出，防止有人持续投票刷屏。使用 /allowNextVote 命令临时允许投票。使用 /kick [1-3] 发起投票踢出玩家",
	},
  mod_title = {
    en = "Voting Bloc",
    ["zh-cn"] = "投票屏蔽",
  },
  initiate_vote_command = {
    en = "kick"
  },
  initiate_vote_description = {
    en = "kick [1,2,3] - Initiates a vote to kick the player at position [1,2,3]",
    ["zh-cn"] = "kick [1,2,3] - 发起投票踢出指定位置 [1,2,3] 的玩家",
    },
  allow_next_vote_command =  {
    en = "allowNextVote",
  },
  allowing_the_next_vote = {
    en = "allowing the next vote",
    ["zh-cn"] = "允许下一次投票",
  },
  always_vote = {
    en = "Always vote",
    ["zh-cn"] = "总是投票",
  },
  yn_group = {
    en = "Vote hotkeys",
    ["zh-cn"] = "投票快捷键",
  },
  auto_group = {
    en = "Auto vote",
    ["zh-cn"] = "自动投票",
  },
  option_yes = {
    en = "Yes",
    ["zh-cn"] = "是",
  },
  option_no = {
    en = "No",
    ["zh-cn"] = "否",
  },
  option_on = {
    en = "On",
    ["zh-cn"] = "开启",
  },
  option_off = {
    en = "Off",
    ["zh-cn"] = "关闭",
  },
  cast_vote = {
    en = "Automatically vote",
    ["zh-cn"] = "自动投票",
  },
  describe_auto = {
    en = "If turned on, it will always vote the choice set in 'Always Vote'. Otherwise you will be able to vote using the hotkeys",
    ["zh-cn"] = "启用后，在投票时会自动选择“总是投票”中设置的选项。否则你可以通过快捷键投票",
    },
  vote_yes = {
    en = "Vote yes",
    ["zh-cn"] = "投票“是”",
  },
  casted_yes_vote = {
    en = "Voted Yes on the kick",
    ["zh-cn"] = "已投票同意踢出",
    },
  vote_no = {
    en = "Vote no",
    ["zh-cn"] = "投票“否”",
  },
  casted_no_vote = {
    en = "Voted No on the kick",
    ["zh-cn"] = "已投票拒绝踢出",
    },
  vote_message_start =
  {
    en = "Vote initiated to kick ",
    ["zh-cn"] = "开始投票踢出 ",
  },
  vote_message_end = {
    en = " ",
    ["zh-cn"] = " ",
  },
  initiating_kick = {
    en = "Initiating kick against ",
    ["zh-cn"] = "发起投票踢出 ",
  },
  cannot_kick_bot = {
    en = "You cannot kick the bot ",
    ["zh-cn"] = "你不能踢出机器人 ",
    },
}
