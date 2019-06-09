winClass = window.get_active_class()
exceptions = ["st-256color.st-256color"]

if winClass in exceptions:
    keyboard.send_keys("<shift>+<insert>")
else:
    keyboard.send_keys("<ctrl>+v")