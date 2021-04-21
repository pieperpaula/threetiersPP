# imports
from flask import Flask, render_template, request, redirect, jsonify

# web application
app = Flask(__name__)

# default landing page
@app.route('/')
def index():
    return render_template('/index.html')

# inspect posted data
@app.route('/viewer', methods=['GET','POST'])
def viewer():
    inspect = {}
    inspect['args'] = request.args
    inspect['form'] = request.form
    inspect['values'] = request.values
    inspect['first'] = request.form['first']
    inspect['last'] = request.form['last']
    return jsonify(inspect)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)


# query string sample
# curl 'localhost:3000/viewer?username=alex'

# post using curl
# curl --data "first=peter&last=parker" localhost:3000/viewer

