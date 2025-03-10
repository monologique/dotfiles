local hyper = {"shift", "cmd", "alt", "ctrl"}

hs.hotkey.bind(hyper, "e", function()
	local windows = hs.window.allWindows()
	local found = false
	local emacs_app = nil

	for _, win in pairs(windows) do
		local app = win:application()
		if string.match(app:name(), "Emacs") then
			found = true
			emacs_app = win
		end
	end
	if found then
		emacs_app:focus()
	else
		hs.execute("emacsclient -r -n", true)
	end
end)
