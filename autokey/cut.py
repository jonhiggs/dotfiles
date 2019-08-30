keyboard.send_keys("<ctrl>+x")
system.exec_command("xsel -o -b | tmux load-buffer -")