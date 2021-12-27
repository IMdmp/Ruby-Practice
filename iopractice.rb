# frozen_string_literal: true

location = '/Users/Nicky/Desktop/lorem.txt'
# fd = IO.sysopen location
# lorem = IO.new(fd)
# p lorem.gets
# p lorem.pos

# p lorem.gets
# p lorem.gets
# p lorem.gets
# p lorem.eof?

fd = IO.sysopen location, 'w+'
io = IO.new(fd)

io.puts 'hello world'
io.puts 'second line'

io.rewind
io.pos
p io.gets
io.puts 'replace second line'
