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

@app.route('/updateGenreForm')
def create():
    return render_template('/updateGenre.html')

@app.route('/updateGenre', methods=['POST'])
def add():
    # Fetch form data
    genre = request.form
    GenreID = genre['GenreID']
    Name = genre['GenreName']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE Genres SET name=%s WHERE GenreID=%s",(Name, GenreID))
    mysql.get_db().commit()
    return redirect('/readGenre')

@app.route('/readGenre')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Genres")
    html = ''    
    if response > 0:
        genres = cursor.fetchall()
        return render_template('readGenre.html', list=genres)
        
# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)