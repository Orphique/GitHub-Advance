# commit 1
cat > README.md <<'EOF'
# Sample app

A simple app that do this...
EOF

cat > .gitignore <<'EOF'
.DS_Store
*.log
EOF

git add .
git commit -m "add README and gitignore"

# commit 2
cat > app.py <<'EOF'
def greet(name):
	return f"Hello, {name}!"

print(greet("world!"))
EOF

git add app.py
git commit -m "add greeting feature"

# commit 3
sed -i '' 's/world/World/' app.py 2>/dev/null || \
sed -i 's/world/World/' app.py

git add app.py
git commit -m "standardize greeting capitalization"

# commit 4
cat > USAGE.md <<'EOF'
# Usage

Run the app with:

python app.py
EOF

git add USAGE.md
git commit -m "add instuction on how to run the app"

# commit 5
cat >/app.py <<'EOF'
def greet(name):
    return f"Hello, {name}!"

def main():
    print(greet("World"))

if __name__ == "__main__":
    main()
EOF

git add app.py
git commit -m "extract main entry point"

# Commit 6: small feature
cat >> app.py <<'EOF'

def greet_uppercase(name):
    return greet(name).upper()
EOF

git add app.py
git commit -m "add uppercase greeting helper"

# Create chloe branch for hotfix practice
git checkout -b chloe

# commit 7: introduce error in app.py
cat >> app.py <<'EOF'

DEBUG: temporary debug line - DELETE THIS
print("DEBUG: This should not be in production")
EOF

git add app.py
git commit -m "add debug statement"

# commit 8: add error.py file
cat > error.py <<'EOF'
# This file was accidentally committed - DELETE THIS FILE
# Emergency hotfix placeholder
EOF

git add error.py
git commit -m "add error.py"

echo "6 commits on main branch, 2 commits on chloe branch created"
echo "You are now on the 'chloe' branch"
echo "Check with git log --oneline and git branch"