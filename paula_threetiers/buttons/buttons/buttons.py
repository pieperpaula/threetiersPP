# imports
from flask import Flask, render_template, request, redirect
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

@app.route('/')
def index():
    return redirect('/read')

@app.route('/delete')
def delete():
    id = request.args.get('id')
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM colleges WHERE CollegeID=%s",id)
    mysql.get_db().commit()
    return redirect('/read')

@app.route('/college')
def college():
    college = {}
    college['id'] = request.args.get('id')
    college['name'] = request.args.get('name')    
    return render_template('college.html', college=college)

@app.route('/update', methods=['POST'])
def add():
    college = request.form
    id = college['id']
    name = college['collegeName']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE colleges SET name=%s WHERE CollegeID=%s",(name, id))
    mysql.get_db().commit()
    return redirect('/read')

@app.route('/read')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM colleges")
    html = ''    
    if response > 0:
        colleges = cursor.fetchall()
        return render_template('read.html', list=colleges)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)