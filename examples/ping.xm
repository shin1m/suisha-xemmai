system = Module("system"
print = system.out.write_line
suisha = Module("suisha"

other = null
thread = Thread(@
	suisha.main(@(loop)
		::other = loop
		wait = loop.wait
		loop.wait = @
			print("before wait"
			wait(
			print("after wait"
		loop.run(

try
	suisha.main(@(loop)
		loop.poll(0, suisha.POLLIN, @(events) if (events & suisha.POLLIN) != 0
			line = system.in.read_line(
			if line.size() > 0
				line = line.substring(0, line.size() - 1
				other.post(@
					print("ping: " + line
					loop.post(@
						print("pong: " + line
			else
				loop.exit(
		loop.run(
finally
	other.post(@
		other.exit(
	thread.join(
