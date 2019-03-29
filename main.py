from flask import Flask,render_template ,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from werkzeug import secure_filename
from datetime import datetime
import os
import json
import math


with open('config.jason','r') as c:
    params = json.load(c) ['params']

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '587', # gmail ka default parameter hai.
    Mail_USE_SSL = True,
    MAIL_USE_TLS = True,
    # MAIL_USERNAME = 'satendratiwari29@gmail.com',
    MAIL_USERNAME = params['gmail-user'],
    # MAIL_PASSWORD = "gt291292@"
    MAIL_PASSWORD = params['gmail-password']
)

mail=Mail(app)

if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_url']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_url']

# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/codingthunder'

db = SQLAlchemy(app)

  # yr intailize hai jo db app ko intialize karega..

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80),nullable=False)
    phone_num = db.Column(db.String(15),nullable=False)
    msg = db.Column(db.String(120),nullable=False)
    date = db.Column(db.String(12),nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80),nullable=False)
    slug = db.Column(db.String(21),nullable=False)
    content = db.Column(db.String(120),nullable=False)
    tagline = db.Column(db.String(120),nullable=False)
    date = db.Column(db.String(12),nullable=True)
    img_file = db.Column(db.String(12),nullable=True)



@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    # [0:params['no_of_posts']]

    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):
                  (page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
    # Pagination Logic
    #First
    # Prev = page Blank
    # Next = Page +1
    if (page==1):
        prev = "#"
        next = "/?page="+str(page+1)
    elif(page==last):
        next = "#"
        prev = "/?page=" + str(page-1)
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    #Middle
    # prev  = page -1
    # next = page + 1
    #Last
    # prev = page -1
    # next = page + 1

    return render_template('index.html',params=params,posts=posts,prev=prev,next=next)

@app.route("/edit/<string:sno>" ,methods = {'GET','POST'})
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            box_title = request.form.get('title')
            box_tline = request.form.get('tline')
            box_slug = request.form.get('slug')
            box_content = request.form.get('content')
            box_img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=='0':
                post = Posts(title=box_title,slug=box_slug,content=box_content,
                             tagline = box_tline,img_file=box_img_file,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = box_slug
                post.content = box_content
                post.tagline = box_tline
                post.img_file = box_img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)
        post=Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params,post=post)


@app.route("/post/<string:post_slug>", methods=['GET'])  # mera jo slug hai yanha par aa ajyega..
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post)


@app.route("/about")
def about():
    return render_template('about.html',params=params)


@app.route("/dashboard" , methods = ['GET','POST'])
def dashboard():
    if ('user' in session and  session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)

    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_password']):
            # set the session variables
            session['user'] = username
            posts =Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)
    return render_template('login.html',params=params)

@app.route("/uploader", methods =['GET' , 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == 'POST'):
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded successfully"


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:sno>", methods = ['GET' , 'POST'])
def delete(sno):
        if ('user' in session and session['user'] == params['admin_user']):
            post = Posts.query.filter_by(sno=sno).first()
            db.session.delete(post)
            db.session.commit()
        return redirect('/dashboard')

@app.route("/contact" , methods=['GET','POST'])
def contact():
    if (request.method == 'POST'):

        '''
        Add Entry to the Database
        '''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name,phone_num=phone,msg=message,date=datetime.now(),email=email)
        db.session.add(entry)
        db.session.commit()   # Entert Database me Add Ho jayegee.
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients = [params['gmail-user']],
                          body = message + "\n" + phone
                          )   # jaise hi ye function run hoga email send ho jayega..

    return render_template('contact.html',params=params)



app.run(debug=True)