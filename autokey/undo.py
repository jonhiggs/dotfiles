winClass = window.get_active_class()
exceptions = ["st-256color.st-256color"]

if winClass not in exceptions:
    keyboard.send_key("<ctrl>+z")
else:
    keyboard.send_keys("<super>+z")
