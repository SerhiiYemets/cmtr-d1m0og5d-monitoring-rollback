from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello from the environment d1m0og5d!\n", 200

@app.route("/health")
def health():
    return "OK\n", 200

if name == "__main__":
    app.run(host="0.0.0.0", port=8000)
