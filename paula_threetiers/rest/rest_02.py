# import package
from flask import Flask, jsonify, request

# create application instance
app = Flask(__name__)

# root route - landing page
@app.route('/', methods=['GET','POST'])
def hello_world():
    if (request.method == 'POST'):
        someJson = request.get_json()
        return jsonify({'yourData': someJson}), 201
    else:
        return jsonify({'message': 'Hello, World!'})

@app.route('/timesTen/<int:num>', methods=['GET'])
def timesTen(num):
    return jsonify({'result': num*10});

# start server - note the port is 3000
if __name__ == '__main__':
    app.run(debug=True, port=3000)
