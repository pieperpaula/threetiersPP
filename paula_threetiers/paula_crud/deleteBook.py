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

@app.route('/deleteBookForm')
def create():
    return render_template('/deleteBook.html')

@app.route('/deleteBook', methods=['POST'])
def add():
    # Fetch form data
    book = request.form
    BookID = book['BookID']
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM Books WHERE BookID=%s",BookID)
    mysql.get_db().commit()
    return redirect('/readBook')

@app.route('/readBook')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Books")
    html = ''    
    if response > 0:
        books_1 = cursor.fetchall()
        return render_template('readBooks.html', list=books_1)
        
# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)