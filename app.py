from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def home():
    return render_template('index.html')


# Port used internally NOT the port that you'll access from the browser (specified in Dockerfile (wow port mapping!!! OMG))
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=4090, debug=True)
