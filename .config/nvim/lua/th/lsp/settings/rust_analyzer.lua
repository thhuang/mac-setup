return {
	server = {
		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "by_self",
				},
				cargo = {
					autoReload = true,
					loadOutDirsFromCheck = true,
				},
				procMacro = {
					enable = true,
				},
			},
		},
	},
}
