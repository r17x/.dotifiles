## Scripts (personal) 

### Migrate to `ReScript`
```shell
for file in src/**/*.re;
do
CURRENT_FILE=$(pwd)/$file; NEW_FILE="$(echo $CURRENT_FILE | sed -e "s/\.re/\.res/g")"; ./node_modules/.bin/bsc  -format $CURRENT_FILE > $NEW_FILE; rm -f $CURRENT_FILE;
done;
```

