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

@app.route('/createAuthorForm')
def create():
    return render_template('/createAuthor.html')

@app.route('/createAuthor', methods=['POST'])
def add():
    # Fetch form data
    Author = request.form
    print(Author)
    AuthorID = Author['AuthorID']
    Name = Author['Name']
    cur = mysql.get_db().cursor()
    cur.execute("INSERT INTO Authors(AuthorID,Name) VALUES(%s, %s)",(AuthorID, Name))
    mysql.get_db().commit()
    return redirect('/readAuthor')

@app.route('/readAuthor')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Authors")
    html = ''    
    if response > 0:
        books = cursor.fetchall()
        return render_template('readAuthor.html', list=books)
        
# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)