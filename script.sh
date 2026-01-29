mkdir -p docs/_sites
rm -rf docs/_sites
mkdir -p docs/_sites

# Find every "docs" folder that is NOT the root docs
find . -type d -name docs ! -path "./docs" | while read d; do
  # make a safe folder name based on path, e.g. Champions league/MD1/docs -> Champions_league_MD1
  name=$(echo "$d" | sed 's|^\./||' | sed 's|/docs$||' | tr '/ ' '__')
  mkdir -p "docs/_sites/$name"
  cp -R "$d/"* "docs/_sites/$name/"
done
