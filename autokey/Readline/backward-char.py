winClass = window.get_active_class()
exceptions = ["st-256color.st-256color"]

if winClass not in exceptions:
    keyboard.send_key("<left>")
else:
    keyboard.send_keys("<ctrl>+b")