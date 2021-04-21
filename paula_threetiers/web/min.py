# import package
from flask import Flask

# create application instance
app = Flask(__name__)

# root route - landing page
@app.route('/')
def hello_world():
    return 'Hello, Phil!'

# start server - note the port is 3000
if __name__ == '__main__':
    app.run(debug=True, port=3000)