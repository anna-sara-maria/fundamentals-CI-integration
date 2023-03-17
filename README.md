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
Wrote the initial POST-request handling, pulling of git repositories and Flake8 linting.

### Anna Kristiansson (anna-sara-maria / annakris) 

Notification

### Adrian Valdani (adde300 / adriankv)
Wrote the save_results function, formatting information from relevant commit into a readable string.

### Gustaw Siedlarski (gustawsi)
Wrote initial server test functions and creation of urls/saving of info, the latter of which was not merged in the end (the prototype can be found in the create_urls branch) Fixed the bug which made the server only ever run the test cases from the first POST-request received.

### Levi Leyh (levi-tating)
Wrote `test` in `src/server_funcs.py` which runs the test cases found in `test/test_test.py`
