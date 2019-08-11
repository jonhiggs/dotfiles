winClass = window.get_active_class()

if winClass == "Navigator.Firefox":
    keyboard.send_keys("<ctrl>+[")
elif winClass == "slack.Slack":
    keyboard.send_keys("<super>+<left>")
else:
    keyboard.send_keys("<super>+o")