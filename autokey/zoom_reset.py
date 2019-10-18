winClass = window.get_active_class()

if winClass == "Navigator.firefox":
    keyboard.send_keys("<ctrl>+0")
else:
    keyboard.send_keys("<super>+0")