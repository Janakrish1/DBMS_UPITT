from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os

# Initialize app and SQLAlchemy
basePath = os.path.abspath(os.path.dirname(__file__))
template_dir = os.path.join(basePath, 'templates')

app = Flask(__name__, template_folder=template_dir)

# Database configuration
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:Janakrish%403027@localhost:3306/dbms"
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy
db = SQLAlchemy(app)

# Move this inside the app context
with app.app_context():
    # Now import models after db and app are initialized
    from models.User import User

    # Create all tables in the database
    db.create_all()

# You can add more routes and logic here as needed.
