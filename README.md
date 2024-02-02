# PythonPostGresPythonDB

## Description

This Python project utilizes MongoDB, PostgreSQL, and another PostgreSQL database hosted on Scalingo. It includes Python notebooks (.ipynb) and SQL files located at the root of the project.

### Contributors

- Charly Rousseau
- Vincenzo Cusma
- Flavien Lhuissier

### How to clone this project ?

To clone the project using Git, run:

```bash
git clone https://github.com/CharlyRousseau/PythonPostgresMongoDb.git
```

## Environment Variables

Make sure to set the following environment variables:

```sh
# MongoDB local
MONGO_DB_USER = <user>
MONGO_DB_PASSWORD = <password>
MONGO_DB_PORT = <port>

# PostGreSQL local
POSTGRESQL_LOCAL_USER = <user>
POSTGRESQL_LOCAL_PASSWORD = <password>
POSTGRESQL_LOCAL_PORT = <port>

# PostGreSQL x Scalingo
POSTGRESQL_SCALINGO_URL = <url>
```

## Python Environment Configuration

### Windows

You'll need [PyEnv for Windows](https://github.com/pyenv-win/pyenv-win).

Once installed, at the root of this project, we create a virtual python environment using the `.python-version`

```bash
pyenv install <version in the .python-version>
```

Then, create your virtual environment like this :

```bash
~/.pyenv/pyenv-win/versions/<PYTHON_VERSION>/python.exe -m venv env
```

This command line will create a new folder `env` which will contains your virtual Python environment.

Finally, you can activate your virtual environment & install the needed dependencies like this :

```bash
source env/Script/activate
pip install -r requirements.txt
```

To desactivate the virtual environment :

```bash
deactivate
```

Enjoy !

### Linux / MacOS

You'll need [PyEnv for Linux](https://ggkbase-help.berkeley.edu/how-to/install-pyenv/).

Once installed, at the root of this project, we create a virtual python environment using the `.python-version`

```bash
pyenv install <version in the .python-version>
```

Then, create your virtual environment like this :

```bash
~/.pyenv/versions/<PYTHON_VERSION>/bin/python -m venv env
```

This command line will create a new folder `env` which will contains your virtual Python environment.

Finally, you can activate your virtual environment & install the needed dependencies like this :

```bash
source env/bin/activate
pip install -r requirements.txt
```

To desactivate the virtual environment :

```bash
deactivate
```

Enjoy !
