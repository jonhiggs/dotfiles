winClass = window.get_active_class()

if winClass == "Navigator.firefox":
    keyboard.send_keys("<ctrl>+]")
elif winClass == "slack.Slack":
    keyboard.send_keys("<super>+<right>")
else:
    keyboard.send_keys("<super>+i")