return {
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
		},
	},
}
