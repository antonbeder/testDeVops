from flask import Flask
def my_flask(ip1, ip2, port1):
        APP = Flask(__name__)


        @APP.route('/')
        def hello_world():
            return "test"
        APP.run(host='0.0.0.0', port=int(port1), debug=True)
