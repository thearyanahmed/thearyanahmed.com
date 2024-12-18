cd dist || exit;
git pull --force;
cd ../;
cp -r fsync/markdown dist/
npm run prod;

php artisan responsecache:clear;
php artisan export;

cd public || exit;

git init;
#git remote add origin git@github.com:thearyanahmed/thearyanahmed.github.io.git;
REMOTE_URL="git@github.com:thearyanahmed/thearyanahmed.github.io.git"
REMOTE_NAME="origin"

# Check if the remote already exists
if ! git remote get-url $REMOTE_NAME >/dev/null 2>&1; then
    # If not, add the remote
    git remote add $REMOTE_NAME $REMOTE_URL
    echo "Remote '$REMOTE_NAME' added."
else
    # If it already exists, inform the user
    echo "Remote '$REMOTE_NAME' already exists. Skipping."
fi

cp ../CNAME ./;

git add .;
git commit --allow-empty -m "$DEPLOY_MESSAGE"

git push --force;