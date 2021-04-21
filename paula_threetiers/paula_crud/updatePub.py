from flask import Flask, render_template, request, redirect
from flaskext.mysql import MySQL

# web application
app = Flask(__name__)

# connect to db
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '~~keowee.27~~'
app.config['MYSQL_DATABASE_DB'] = 'book_business'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/updatePubForm')
def create():
    return render_template('/updatePub.html')

@app.route('/updatePub', methods=['POST'])
def add():
    # Fetch form data
    publisher = request.form
    PublisherID = publisher['PublisherID']
    Name = publisher['PubName']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE Publishers SET name=%s WHERE PublisherID=%s",(Name, PublisherID))
    mysql.get_db().commit()
    return redirect('/readPublisher')

@app.route('/readPublisher')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Publishers")
    html = ''    
    if response > 0:
        publishers = cursor.fetchall()
        return render_template('readPub.html', list=publishers)
        
# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)