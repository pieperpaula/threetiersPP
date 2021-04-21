# imports
from flask import Flask, render_template
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

@app.route('/readAuthor')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Authors")
    html = ''    
    if response > 0:
        authors = cursor.fetchall()
        return render_template('readAuthor.html', list=authors)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)