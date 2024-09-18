import shutil
import os
import crypt
import subprocess
import argparse

HOME = os.environ.get('HOME')
vnc_directory = os.path.join(HOME, '.vnc')

if os.path.exists(vnc_directory):
		shutil.rmtree(vnc_directory)
		print(f"Successfully removed {vnc_directory}")
else:
		print(f"{vnc_directory} does not exist")
os.makedirs(vnc_directory, exist_ok=True)
de_was_selected = os.path.join(vnc_directory, '.de-was-selected')
with open(de_was_selected,"w") as f: f.write("")




VNC_PW = os.environ.get('VNC_PW')
VNC_USER = os.environ.get('VNC_USER')
VNC_PORT = 6080

# Generate the hashed password
salt = '$5$kasm$'  # Use this salt for SHA-256 hashing
hashed_pw = crypt.crypt(VNC_PW, salt)

# Write the hashed password to the file
passwd_file = '/root/.kasmpasswd'
with open(passwd_file, 'w') as f:
		f.write(f"root:{hashed_pw}:ow\n")

# Change file permissions
os.chmod(passwd_file, 0o600)

# Run the OpenSSL command to generate a self-signed certificate
openssl_command = [
		'openssl', 'req', '-x509', '-nodes', '-days', '3650',
		'-newkey', 'rsa:2048', '-keyout', os.path.join(vnc_directory,'self.pem'),
		'-out', os.path.join(vnc_directory,'self.pem') ,
		'-subj', '/C=US/ST=VA/L=None/O=None/OU=DoFu/CN=kasm/emailAddress=none@none.none'
]

subprocess.run(openssl_command, check=True)
print("Password file and SSL certificate created successfully.")

kasmvnc_yml = f'''
network:
	protocol: http
	interface: 0.0.0.0
	websocket_port: {VNC_PORT}
	use_ipv4: true
	use_ipv6: true
	udp:
		public_ip: auto
		port: auto
		stun_server: auto
	ssl:
		pem_certificate: /root/.vnc/self.pem
		pem_key: /root/.vnc/self.pem
		require_ssl: false

logging:
	log_writer_name: all
	log_dest: logfile
	level: 1
'''

with open(os.path.join(vnc_directory, 'kasmvnc.yaml'), 'w') as f:
		f.write(kasmvnc_yml)
print("kasmvnc.yml created successfully.")

xstartup = f"""
#!/bin/bash

"""
with open(os.path.join(vnc_directory, 'xstartup'), 'w') as f:
		f.write(xstartup)
os.chmod(os.path.join(vnc_directory, 'xstartup'), 0o700)




