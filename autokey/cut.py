keyboard.send_keys("<ctrl>+x")
system.exec_command("xsel -o -p | tmux load-buffer -")