local status, which_key = pcall(require, "which-key")

if not status then
	print("which-key is not found")
	return
end

-- document existing key chains
which_key.add({
	{ "<leader>c", group = "[C]ode" },
	{ "<leader>c_", hidden = true },
	{ "<leader>d", group = "[D]ocument" },
	{ "<leader>d_", hidden = true },
	{ "<leader>g", group = "[G]it" },
	{ "<leader>g_", hidden = true },
	{ "<leader>h", group = "More git" },
	{ "<leader>h_", hidden = true },
	{ "<leader>r", group = "[R]ename" },
	{ "<leader>r_", hidden = true },
	{ "<leader>s", group = "[S]earch" },
	{ "<leader>s_", hidden = true },
	{ "<leader>w", group = "[W]orkspace" },
	{ "<leader>w_", hidden = true },
	{ "<leader>b", group = "[B]uffer" },
	{ "<leader>b_", hidden = true },
})
