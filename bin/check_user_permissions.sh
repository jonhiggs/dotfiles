#!/bin/bash
host=$1
user=$2

cat <<EOF | ssh ${host}
echo "###TESTING FOR SSH KEYS"
for home in \`cat /etc/passwd | cut -d: -f6\`; do
  auth_key_file="\${home}/.ssh/authorized_keys"
  sudo grep -H -s "${user}" \${auth_key_file}
done

if [ \`grep -c ${user} /etc/passwd\` -ne 0 ]; then echo "### ${user} FOUND IN /etc/passwd"; fi
if [ -d /home/${user} ]; then echo "### DIRECTORY AT /home/${user} FOUND"; fi
EOF
