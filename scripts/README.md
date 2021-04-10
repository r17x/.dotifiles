## Scripts (personal) 

### Migrate to `ReScript`
```shell
for file in src/**/*.re;
do
CURRENT_FILE=$(pwd)/$file; NEW_FILE="$(echo $CURRENT_FILE | sed -e "s/\.re/\.res/g")"; ./node_modules/.bin/bsc  -format $CURRENT_FILE > $NEW_FILE; rm -f $CURRENT_FILE;
done;
```
### Benchmark `zsh configuration`

```shell
❯ for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done

        0.46 real         0.31 user         0.13 sys
        0.45 real         0.31 user         0.12 sys
        0.43 real         0.30 user         0.12 sys
        0.44 real         0.31 user         0.12 sys
        0.44 real         0.30 user         0.12 sys
        0.43 real         0.30 user         0.11 sys
        0.43 real         0.30 user         0.11 sys
        0.43 real         0.30 user         0.12 sys
        0.43 real         0.30 user         0.12 sys
        0.44 real         0.30 user         0.12 sys
```
