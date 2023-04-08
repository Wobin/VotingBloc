local mod = get_mod("Voting Bloc")
local OPTIONS = table.enum("yes", "no")

return {
  name = mod:localize("mod_title"),
  description = mod:localize("mod_description"),
  is_togglable = true,
  options = {
    widgets = {
      {
        setting_id = "always_vote",
        type = "dropdown",
        default_value = OPTIONS.no,
        options = {
          {text = "option_no", value = OPTIONS.no },
          {text = "option_yes", value = OPTIONS.yes }          
        }
      }
    }
  }
}
