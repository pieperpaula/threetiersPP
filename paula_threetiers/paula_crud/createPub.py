# imports
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

@app.route('/createPubForm')
def create():
    return render_template('/createPub.html')

@app.route('/createPub', methods=['POST'])
def add():
    # Fetch form data
    Publisher = request.form
    PublisherID = Publisher['PublisherID']
    Name = Publisher['Name']
    cur = mysql.get_db().cursor()
    cur.execute("INSERT INTO Publishers(PublisherID,Name) VALUES(%s, %s)",(PublisherID, Name))
    mysql.get_db().commit()
    return redirect('/readPub')

@app.route('/readPub')
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