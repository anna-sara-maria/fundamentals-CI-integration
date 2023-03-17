# Continuous Integration 
Git repository for Lab 2 Continuous Integration (Fundamentals of Software Engineering DD2480, Royal Institute of Technology 2023) 
 
## Summary 
This repository contains a continuous integration project that can be connected to different github webhooks to perform automatic tests on newly pushed changes. The result is then e-mailed to the person pushing the changes.

## Licence
Permissions: private and commercial use, modification, distribution.
Conditions: license and copyright notice.
Limitations: liability and warranty. 

## How it works
The project is structured into a src and a test folder. All server code is in the src folder. All finshed code and documentation is found in the main branch and the assessment branch is used for testing purposes in order to avoid dummy commits in the main branch history. The server assumes a given project is written in Python. No compilation checking is thus done, however a linter is run before test cases are executed. The server will search for test cases in test/test_test.py and run them accordingly.

### Functionality overview
Upon receiving a webhook, the server extracts necessary info from the appended json file and creates a temporary directory to which it clones the branch-specific repo. The path for the temporary repository is specified in `config.py` in variable `temp_repo_path` and the name of the git repository is specified in `git_repo_url`. A linter is run and then test cases int test/test_test.py are executed. The lint and test results are saved, together with who pushed the commit and on which branch it was done, and formated into one string which is then sent to the mail list specified in the `send_email` function. For more detailed info go to the src directory and run `python -m pydoc server_funcs`

## Operate the program
### Edit the config file
In `src/config.py` specify the directory where the server should create temporary directories for the cloned repos in variable `temp_repo_path` and specify the git repo name in `git_repo_url.
#### Run server.py with: 
```
python3 src/server.py http
```
#### Start ngrok on the same port (8011) connection:
```
ngrok http 8011
```
(Make sure the webhook in the github repository has the ngrok url)

## Statement of contributions 

### Adam Melander (adrelix / adammel)
Post request handling 

Pulling git repositories

Flake8 linting of repositories

### Anna Kristiansson (anna-sara-maria / annakris) 

Notification

### Adrian Valdani (adde300 / adriankv)
save_results function

### Gustaw Siedlarski (gustawsi)
server test functions 

creation of urls/saving of info (not merged in the end - prototype in create_urls branch)

fix bug with server running wrong test cases

### Levi Leyh (levi-tating)
test function
