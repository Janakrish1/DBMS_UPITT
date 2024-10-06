# import package
from flask import Flask
# create Flask object as the application
app = Flask(__name__)

# mapping the route to a python function


@app.route("/")
def hello():
    return "Hello World!"


if __name__ == "__main__":
    # set 'debug = true' allows to restart application when saving a file
    app.run(debug=True)
