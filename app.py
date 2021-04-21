# To solve the driver problem
# uninstall the following
# -----------------------------------
# pip3 uninstall mysql-connector
# pip3 install mysql-connector-python
# -----------------------------------
# Then install
# -----------------------------------
# pip3 install mysql-connector-python
# ----------------------------------- 

import mysql.connector

cnx = mysql.connector.connect(user='root', 
    password='~~keowee.27~~',
    host='127.0.0.1',
    database='education',
    auth_plugin='mysql_native_password')

cursor = cnx.cursor()
query = ("SELECT * FROM colleges")
cursor.execute(query)

# print all the first cell of all the rows
for row in cursor.fetchall():
    print(row)

cursor.close()
cnx.close()
