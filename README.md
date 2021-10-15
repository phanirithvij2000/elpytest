### elpytest

### Setup

First `Use as template`

Linux

```sh
python3 -m venv venv
./venv/bin/activate
python -m pip install -U pip python-dotenv python-magic
```

Windows

```powershell
python3 -m venv venv
.\venv\Scripts\activate.bat
python -m pip install -U pip python-dotenv python-magic-bin
```

#### Template configuration (REQUIRED):

Look at `config/` folder and change all of them.

Then use

```sh
python scripts/project_replace.py -h # -r -v -i
```

This will replace all the project variables with values from the `config/` files.

Push your local changes

```
git add .
git commit -m "configure project"
```

### Setup actions secrets

```sh
mv config/secrets.env .env
# Enter github actions secrets
# Publish secrets to repo
python ../scripts/setup_actions_secrets.py
```
