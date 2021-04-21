# imports
from flask import Flask, render_template, request, jsonify

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
    inspect['first'] = request.form.get('first')
    inspect['last'] = request.form.get('last')
    inspect['path'] = request.path
    inspect['url'] = request.url
    inspect['base_url'] = request.base_url
    inspect['content_encoding'] = request.content_encoding
    inspect['content_length'] = request.content_length
    inspect['content_type'] = request.content_type
    inspect['host'] = request.host
    inspect['mimetype'] = request.mimetype
    if (request.method == 'POST'):
        inspect['receivedJson'] = request.get_json()
    return jsonify(inspect)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)


# query string sample
# curl 'localhost:3000/viewer?username=alex'

# post using curl
# curl --data "first=peter&last=parker" localhost:3000/viewer

# posting json
# curl -X POST -H "Content-Type: application/json" -d '{"first":"peter"}' localhost:3000/viewer
