winClass = window.get_active_class()

if winClass == "Navigator.firefox":
    keyboard.send_keys("<ctrl>+-")
else:
    keyboard.send_keys("<super>+-")