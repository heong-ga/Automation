# Build with Parameters
    # BASE_BRANCH : base branch from modifying
    # WORKING_REPOSITORY : repository name to work on
    # NEW_BRANCH : new branch name to be created

rm -rf manifest

git clone -b $BASE_BRANCH 

cp ModifyRevision.py manifest
cd manifest

for repo in ${WORKING_REPOSITORY}; do
    file_to_modify = `grep -r '"'$repo'"' --exclude="./IDE.xml" ./* | cut -d ':' -f1 | cut -d "/" -f2`
    python ModifyRevision.py $file_to_modify $repo $NEW_BRANCH
done

rm ModifyRevision.py

git checkout -b $NEW_BRANCH
git add .
git commit -m "$NEW_BRANCH : Create a manifest file"
git push origin $NEW_BRANCH