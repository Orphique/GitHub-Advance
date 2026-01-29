# commit 1
@"
# Sample app

A simple app that do this...
"@ | Set-Content README.md

@"
.DS_Store
*.log
"@ | Set-Content .gitignore

git add .
git commit -m "add README and gitignore"

# commit 2
@"
def greet(name):
    return f"Hello, {name}!"

print(greet("world!"))
"@ | Set-Content app.py

git add app.py
git commit -m "add greeting feature"

# commit 3
(Get-Content app.py) -replace "world", "World" | Set-Content app.py

git add app.py
git commit -m "standardize greeting capitalization"

# commit 4
@"
# Usage

Run the app with:

python app.py
"@ | Set-Content USAGE.md

git add USAGE.md
git commit -m "add instuction on how to run the app"

# commit 5
@"
def greet(name):
    return f"Hello, {name}!"

def main():
    print(greet("World"))

if __name__ == "__main__":
    main()
"@ | Set-Content app.py

git add app.py
git commit -m "extract main entry point"

# Commit 6: small feature
Add-Content app.py @"

def greet_uppercase(name):
    return greet(name).upper()
"@

git add app.py
git commit -m "add uppercase greeting helper"

# Create chloe branch for hotfix practice
git checkout -b chloe

# commit 7: introduce error in app.py
Add-Content app.py @"

DEBUG: temporary debug line - DELETE THIS
print("DEBUG: This should not be in production")
"@

git add app.py
git commit -m "add debug statement"

# commit 8: add error.py file
@"
# This file was accidentally committed - DELETE THIS FILE
# Emergency hotfix placeholder
"@ | Set-Content error.py

git add error.py
git commit -m "add error.py"

Write-Host "6 commits on main branch, 2 commits on chloe branch created"
Write-Host "You are now on the 'chloe' branch"
Write-Host "Check with git log --oneline and git branch"

