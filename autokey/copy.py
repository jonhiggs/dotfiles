keyboard.send_keys("<ctrl>+c")
time.sleep(0.2)
system.exec_command("xsel -o -b | tmux load-buffer -")