winClass = window.get_active_class()
exceptions = ["st-256color.st-256color"]

if winClass not in exceptions:
    keyboard.send_keys("<ctrl>+<right>")
else:
    keyboard.send_keys("<alt>+f")