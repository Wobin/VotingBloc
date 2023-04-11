local mod = get_mod("Voting Bloc")
local OPTIONS = table.enum("yes", "no")

return {
    name = mod:localize("mod_title"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id = "cast_vote",
                type = "dropdown",
                default_value = "off",
                tooltip = "describe_auto",
                options = {
                    {
                        text = "option_on",
                        value = "on",
                        --show_widgets = {1, 2}
                    },
                    {
                        text = "option_off",
                        value = "off",
                        --show_widgets = {3}
                    }
                },
                sub_widgets = {
                   {
                    setting_id = "auto_group",
                    type = "group",                    
                    sub_widgets = {
                    {
                        setting_id = "always_vote",
                        type = "dropdown",
                        default_value = OPTIONS.no,
                        options = {
                            {text = "option_no", value = OPTIONS.no},
                            {text = "option_yes", value = OPTIONS.yes}
                        }
                    }
                    }
                },
                  {
                    setting_id = "yn_group",
                    type = "group",                    
                    sub_widgets = {
                      {
                        setting_id = "vote_yes",
                        type = "keybind",
                        default_value = {"f2"},
                        keybind_trigger = "pressed",
                        keybind_type = "function_call",
                        function_name = "voting_yes"
                      },
                      {
                          setting_id = "vote_no",
                          type = "keybind",
                          default_value = {"f3"},
                          keybind_trigger = "pressed",
                          keybind_type = "function_call",
                          function_name = "voting_no"
                      }
                    }
                    },
                }
            }
        }
    }
}
