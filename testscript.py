from flaskscript import my_flask
import sys
import socket
ip1 = str(sys.argv[1]) # 1st IP ARGUMENT
ip2 = str(sys.argv[2]) # 2nd IP ARGUMENT
port1 = str(sys.argv[3]) # PORT ARGUMENT
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
result = sock.connect_ex((ip1,int(port1)))
if result == 0:
       print("Port is open")
else:
       print ("Port is not open")
sock.close

my_flask(ip1, ip2, port1)
