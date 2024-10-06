from app import app, db
from models.User import User
from flask import render_template, request

import bcrypt


@app.route("/")
def index(username=None):
    users = User.query.all()
    return render_template("users.html", users=users, username=username)


@app.route("/register", methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template("register.html")
    else:
        name = request.form.get('username')
        password = request.form.get('password')
        hashed_password = bcrypt.hashpw(
            password.encode('utf-8'), bcrypt.gensalt())
        user = User(name, hashed_password)
        db.session.add(user)
        db.session.commit()
        return index(name)


if __name__ == "__main__":
    app.run(debug=True)
