# imports
from flask import Flask
from flaskext.mysql import MySQL

# web application
app = Flask(__name__)

# connect to db
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '~~keowee.27~~'
app.config['MYSQL_DATABASE_DB'] = 'education'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/colleges')
def colleges():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM colleges")
    html = ''    
    if response > 0:
        colleges = cursor.fetchall()
        for college in colleges:
            html += college[1] + '<br/>'
        return html

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)