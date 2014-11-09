# Quine McClusky
Quine McClusky algorithm implemented in Python(Flask) with a Web UI made using Backbone and Bootstrap. 
It also include A circuit drawing interface made using JointJS.

## Building and Running the Software

### Installing Dependencies

* first make sure you have the latest version of:
    * [Node.js](http://nodejs.org/download/  "Node.js Download")
    * [Ruby](https://www.ruby-lang.org/en/downloads/ "Ruby Download")
    * [Git](http://git-scm.com/downloads "Git Download")
    * [Python 2.7](https://www.python.org/download/releases/2.7/ "Python Download")
    * [pip](http://pip.readthedocs.org/en/latest/installing.html "pip Download")
    
* Run the following. An output similar to this when you execute the following on your command line prompt
```bash
$ node -v
v0.10.33
$ npm -v
1.4.28
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-linux]
$ gem -v
2.2.2
$ git --version
git version 2.1.0
$ python -V
Python 2.7.8
$ pip -V
pip 1.5.6 from /usr/lib/python2.7/dist-packages (python 2.7)
```
* cd to your our chosen directory and clone the repo using git
```bash
$ git clone https://github.com/omarayad1/McClusky.git
```
* Install the following Node & Ruby Dependencies
```bash
sudo npm install -g grunt-cli
sudo npm install -g bower
sudo npm install -g coffee-script
sudo gem install compass
```
* Install the following Python dependencies
```
sudo pip install Flask
sudo pip install nose # optional
```

### Building & Running the Frontend

* Change your dir to frontend dir and execute the following commands
```bash
$ cd frontend
$ sudo npm install
$ bower install
$ grunt serve
```
* A new browser window will open with the frontend running. Don't interact with it yet
* Frontend Working

![Frontend Console](img/frontend.png)

### Building & Running the Backend

* Open a new terminal window and change your dir to the server dir and just excute the following command
```bash
$ cd ../server
$ python main.py
```
* The server will be running and you may interact with the frontend as it should be working perfectly
* If you want to run the tests you must have nose installed and just run the following command
```bash
$ sudo pip install nose
$ nosetests
```
* Backend Console

* ![Backend Console](img/server.png)

## Screenshots

![start](img/start.png)

![terms](img/terms.png)

![truth](img/truth.png)

![prime](img/prime.png)

![essential](img/essential.png)

![dominating](img/dominating.png)

![final](img/final.png)

![circuit](img/circuit.png)


## Contributors

<table>
<tr><th>Name</th><th>Github</th></tr>
<tr><td>Omar Ayad</td><td><a href="https://github.com/omarayad1">omarayad1</a></td></tr>
<tr><td>Ahmad Yasser</td><td><a href="https://github.com/ahmadyasserk">ahmadyasserk</a></td></tr>
</table>
