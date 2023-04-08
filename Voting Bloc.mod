return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`Voting Bloc` encountered an error loading the Darktide Mod Framework.")

		new_mod("Voting Bloc", {
			mod_script       = "Voting Bloc/scripts/mods/Voting Bloc/Voting Bloc",
			mod_data         = "Voting Bloc/scripts/mods/Voting Bloc/Voting Bloc_data",
			mod_localization = "Voting Bloc/scripts/mods/Voting Bloc/Voting Bloc_localization",
		})
	end,
	packages = {},
}
