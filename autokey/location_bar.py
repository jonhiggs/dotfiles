winClass = window.get_active_class()

if winClass == "Navigator.Firefox":
    keyboard.send_keys("<ctrl>+l")
elif winClass == "slack.Slack":
    keyboard.send_keys("<ctrl>+k")
else:
    keyboard.send_keys("<super>+l")