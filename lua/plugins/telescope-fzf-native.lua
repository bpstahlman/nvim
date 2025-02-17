-- TODO: Will this be loaded when telescope is disabled? Can I move this into the telescope config? (TODO)
return {
	'nvim-telescope/telescope-fzf-native.nvim',
	build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
}
