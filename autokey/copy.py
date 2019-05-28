keyboard.send_keys("<ctrl>+c")
system.exec_command("xsel -o -b | xsel -i -p")
system.exec_command("xsel -o -p | tmux load-buffer -")