sudo apt-get install -qy  python-dev libssl-dev  sshpass build-essential libffi-dev
sudo pip install setuptools pip --upgrade
# We have to do this here because Ansible cannot upgrade ansible without bombs going off.
sudo pip install ansible==2.5.10
rm -rf ansible-push-keys
git clone https://github.com/cumulusnetworks/ansible-push-keys
cd ansible-push-keys; cat /etc/dhcp/dhcpd.hosts | grep 'host .* {' | cut -d " " -f 2 >> hosts
cd ansible-push-keys; ansible-playbook push-keys.yml --extra-vars 'ansible_ssh_pass=CumulusLinux!' --extra-vars 'ansible_become_pass=CumulusLinux!' | tee -a ../playbook1_output.txt
ansible-playbook setup.yaml | tee -a playbook2_output.txt
