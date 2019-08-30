winClass = window.get_active_class()
exceptions = ["st-256color.st-256color"]
ctrl_home = ["Navigator.firefox"]

if winClass in ctrl_home:
    keyboard.send_keys("<ctrl>+<home>")
if winClass in exceptions:
    keyboard.send_keys("<ctrl>+a")
else:
    keyboard.send_key("<home>")
