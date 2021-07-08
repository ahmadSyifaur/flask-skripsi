from flask import Flask,flash, render_template, request, redirect, url_for,session,g
from flask_mysqldb import MySQL
from webFont import getWebFont
from flask_bcrypt import Bcrypt
from cosine import get_tf_idf_query_similarity
import pandas as pd
import string

import os


app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'font_db'
 
mysql = MySQL(app)
bcrypt = Bcrypt()
# @app.route("/")
# def hello():
#     return "Hello, World!"
@app.route('/web-font', methods=["POST","GET"])
def web_font(): 
    if g.username:
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM web_font')
        font = cursor.fetchall()
        cursor.close()
        if request.method == "POST":
            webURL = request.form['web-source']
            getFont = getWebFont(webURL)
            return render_template('admin/font-website.html', menu='font', jenisfont= 'website', data=font, fontFromWebsite= getFont, webUrl=webURL, uname=session['username'])
        else:
            return render_template('admin/font-website.html', menu='font', jenisfont= 'website', data=font)
    # return render_template('admin/index.html', dataWebFont=font)
    else:
        return render_template('admin/admin-login.html')
    
@app.route('/deleteWebFont/<string:id_data>', methods = ['GET'])
def delete(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM web_font WHERE web_font_id=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('web_font'))

@app.route('/insertWebFont', methods=["POST","GET"])
def insertWebFont(): 
    websiteLink = request.form['webURL']
    combinationFont = request.form['fontWebResult']
    if request.method == "POST" :
        cursor = mysql.connection.cursor()
        row= cursor.execute('SELECT website_link FROM web_font WHERE website_link LIKE %s',("%"+websiteLink+"%",))
        font = cursor.fetchone()
        cursor.close()
        if row == 0 :
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO web_font (website_link,combination_font) VALUES (%s, %s)',(websiteLink,combinationFont))
            mysql.connection.commit()
            return redirect(url_for('web_font'))
        else:
            flash('Sudah Ada')
            return redirect(url_for('web_font'))
    else:
        return render_template("ERROR")



@app.before_request
def before_request():
   g.username = None
   if 'username' in session:
       g.username = session['username']

@app.route("/admin")
def admin():
    if g.username:
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM web_font')
        font = cursor.fetchall()
        cursor.close()
        return render_template('admin/index.html', menu='Dashboard', jenisfont= '', data=font, uname=session['username'])
    else:
        return render_template('admin/admin-login.html')

def countWeb():
    
    return res

@app.route("/")
def main():
    return render_template('index.html')

@app.route("/login",methods=['GET','POST'])
def login():
    cursor = mysql.connection.cursor()
    if request.method=='POST':
        email = request.form['email']
        password = request.form['password']
        cursor.execute('SELECT * FROM admin_user WHERE email=%s AND password=%s',(email,password))
        record = cursor.fetchone()
        if record is not None:
            session.pop('username',None)
            # if (bcrypt.check_password_hash(record[1],password)) == True:
            if password == record[2]:
                session['loggedin']=True
                session['username']=request.form['email']
                return render_template('admin/index.html',uname=email)
                # return redirect(url_for('web_font'),uname=email)
            else:
                flash('Invalid Username or Password !!')
                return render_template('admin/admin-login.html')
        else:
            flash('Invalid Username or Password !!')
            return render_template('admin/admin-login.html')
    else:
        return render_template('admin/admin-login.html')

# @app.route("/logout")
# def logout():
#     session['loggedin']=None
#     session['username']=None
#     redirect(url_for('admin'))
#     return redirect(url_for('login'))

@app.route('/logout')
def logout():
    session.clear()
    return render_template('admin/admin-login.html')

@app.route("/font-poster")
def fposter():
    if g.username:
        return render_template('admin/font-poster.html', menu='font', jenisfont= 'poster')
    else:
        return render_template('admin/admin-login.html')

@app.route("/rekomendasi-font-website",methods=['GET','POST'])
def userWebFont():
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM web_font')
        font = cursor.fetchall()
        cursor.close()
        cosimVal={}
        if request.method == "POST":
            if "submit_btn" in request.form:
                query = request.form['user-font-query']
                query_split = query.split(", ")
                query_tmp=[s.replace(' ', '') for s in query_split]
                query_join = ' '.join(query_tmp)

                df = pd.DataFrame(font)
                # df = df[["website_link","combination_font"]]
                df = df[[1,2]]
                # df['combination_font'] = df['combination_font'].map(lambda x: x.lower().split(','))
                df[2] = df[2].map(lambda x: x.lower().split(','))

                SYMBOLS = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
                
                results = []
                final = []

                for i in df[2]:
                    temp = ""
                    for ch in i:
                        ch=ch.replace(' ', '' )
                        ch=ch.replace('\'', ' ' )
                        if ch not in SYMBOLS:
                            temp += ch

                    results.append(temp)

                cosimVal = get_tf_idf_query_similarity(results,query_join)
                return render_template('user-web-font.html', menu='font', jenisfont= 'website', data=font, cosimval=cosimVal)
            else:
                return render_template('user-web-font.html', menu='font', jenisfont= 'website')
            # cosimVal = results
            # getCosime=get-font-web-documents(font, query)
            # getFont = getWebFont(webURL)
            
        else:
            return render_template('user-web-font.html', menu='font', jenisfont= 'website',)

@app.route("/font-poster-kombinasi")
def fposterfont():
    if g.username:
        return render_template('admin/font-poster-kombinasi.html', menu='font', jenisfont= 'poster_kombinasi')
    else:
        return render_template('admin/admin-login.html')

if __name__ == "__main__":
    app.run(debug = True)