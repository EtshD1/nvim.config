local status, comment = pcall(require, "Comment")

if not status then
	print("Comment is not found")
	return
end

comment.setup()
