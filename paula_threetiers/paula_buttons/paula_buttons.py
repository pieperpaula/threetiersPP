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

@app.route('/button')
def index():
    return redirect('/readBookButton')

@app.route('/deleteBookButton')
def delete():
    BookID= request.args.get('BookID')
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM Books WHERE BookID=%s",BookID)
    mysql.get_db().commit()
    return redirect('/readBookButton')

@app.route('/Book')
def book():
    book = {}
    book['BookID'] = request.args.get('BookID')
    book['Title'] = request.args.get('Title')    
    return render_template('book_buttons.html', book=book)

@app.route('/updateBookButton', methods=['POST'])
def add():
    book = request.form
    BookID = book['BookID']
    Title = book['Title']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE books SET Title=%s WHERE BookID=%s",(Title, BookID))
    mysql.get_db().commit()
    return redirect('/readBookButton')

@app.route('/readBookButton')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Books")
    html = ''    
    if response > 0:
        books = cursor.fetchall()
        return render_template('readBookButton.html', list=books)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)