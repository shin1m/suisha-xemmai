system = Module("system"
print = system.out.write_line
io = Module("io"
os = Module("os"
assert = @(x) x || throw Throwable("Assertion failed."
suisha = Module("suisha"

array_equals = @(x, y)
	n = x.size()
	n == y.size() || return false
	for i = 0; i < n; i = i + 1; x[i] == y[i] || return false
	true

assert(suisha.loop() === null
suisha.main(@
	assert(suisha.loop() !== null
assert(suisha.loop() === null

setup = @(loop)
	log = [
	wait = loop.wait
	loop.wait = @
		log.push("wait"
		wait(
	log

suisha.main(@
	loop = suisha.loop(
	log = setup(loop
	loop.post(@
		log.push("post"
		loop.exit(
	loop.run(
	assert(array_equals(log, [
		"wait"
		"post"
suisha.main(@
	loop = suisha.loop(
	log = setup(loop
	t = Thread(@
		loop.post(@
			log.push("post"
			loop.exit(
	loop.run(
	t.join(
	assert(array_equals(log, [
		"wait"
		"post"
suisha.main(@
	loop = suisha.loop(
	log = setup(loop
	fds = os.pipe(
	file = io.File(fds[0], true
	try
		reader = io.Reader(file.read, "utf-8"
		loop.poll(fds[0], suisha.POLLIN, @(events) if (events & suisha.POLLIN) != 0
			log.push(reader.read_line(
			loop.exit(
		t = Thread(@
			file = io.File(fds[1], true
			try
				io.Writer(file.write, "utf-8").write_line("poll"
			finally
				file.close(
		loop.run(
		t.join(
	finally
		file.close(
	assert(array_equals(log, [
		"wait"
		"poll\n"
suisha.main(@
	loop = suisha.loop(
	log = setup(loop
	fds = os.pipe(
	loop.poll(fds[1], suisha.POLLOUT, @(events) if (events & suisha.POLLOUT) != 0
		file = io.File(fds[1], true
		try
			io.Writer(file.write, "utf-8").write_line("poll"
			loop.exit(
		finally
			loop.unpoll(fds[1]
			file.close(
	log.share(
	t = Thread(@
		file = io.File(fds[0], true
		try
			log.push(io.Reader(file.read, "utf-8").read_line(
		finally
			file.close(
	loop.run(
	t.join(
	assert(array_equals(log, [
		"wait"
		"poll\n"
suisha.main(@
	loop = suisha.loop(
	log = setup(loop
	loop.timer(@
		log.push("timer"
		loop.exit(
	, 100, true
	loop.run(
	assert(array_equals(log, [
		"wait"
		"timer"
suisha.main(@
	loop = suisha.loop(
	log = setup(loop
	n = 0
	loop.timer(@
		log.push("timer"
		:n = n + 1
		n < 8 || loop.exit(
	, 100
	loop.run(
	assert(array_equals(log, [
		"wait"
		"timer"
		"wait"
		"timer"
		"wait"
		"timer"
		"wait"
		"timer"
		"wait"
		"timer"
		"wait"
		"timer"
		"wait"
		"timer"
		"wait"
		"timer"
