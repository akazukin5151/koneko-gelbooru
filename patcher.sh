clone=0
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -c|--clone) clone=1 ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [ $clone -eq 1 ]; then
    if [ -d 'build' ]; then rm -Rf 'build'; fi
    mkdir -p build
    cd build

    git clone https://github.com/twenty5151/koneko.git

    cp ../*.py koneko/koneko
    rm koneko/setup.py
    mv koneko/koneko/setup.py koneko/
    cp ../requirements.txt koneko/

    # For reference, doesn't include koneko -> koneko-gelbooru search and replace
    cd koneko
    git diff > ../../patch.diff

    grep -rl 'koneko' . | grep -v '.git' | xargs sed -i 's/koneko/koneko_gelbooru/g'
    mv koneko koneko_gelbooru

    exit 0
fi


echo "Only moving files, no diff generated (use -c|--clone)"
cd build
cp ../*.py koneko/koneko_gelbooru
rm koneko/setup.py
mv koneko/koneko_gelbooru/setup.py koneko/
cp ../requirements.txt koneko/

