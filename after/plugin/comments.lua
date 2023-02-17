local status, comments = pcall(require, "Comment")

if not status then
	print("Comment not found")
	return
end

-- Enable Comment.nvim
comments.setup()
