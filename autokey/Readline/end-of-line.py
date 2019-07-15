winClass = window.get_active_class()
exceptions = ["st-256color.st-256color"]
ctrl_end = ["Navigator.Firefox"]

if winClass in ctrl_end:
    keyboard.send_keys("<ctrl>+<end>")
elif winClass in exceptions:
    keyboard.send_keys("<ctrl>+e")
else:
    keyboard.send_key("<end>")
