from flask import Flask,render_template


# EB looks for an 'application' callable by default.
app= Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/blog/')
def blog():
    return render_template('blog.html')

@app.route('/generic/')
def generic():
    return render_template('generic.html')

@app.route('/elements/')
def elements():
    return render_template('elements.html')
# run the app.
if __name__ == "__main__":
   
    app.debug = True
    app.run()