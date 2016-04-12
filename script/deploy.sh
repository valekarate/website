cd build
git config --global user.email "travis@valekarate.com"
git config --global user.name "Kevin Prince"
git remote add gh-pages https://$GITHUB_CRED@github.com/valekarate/website.git
cd ..
middleman deploy
