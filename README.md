### OVERVIEW
Use to color your output text

### NOTE
- Underline also colors the text
-  Bold currently doesn't work

### INSTALL
```
cd ~/
git clone git@github.com:trotha01/colors.git
```
Then add to your .bashrc or .bash_profile:
```
source colors/color.sh
```


### EXAMPLES
Try them out
```
echo "hello there" | red there
echo "hello there" | blue hello | red there
```
```
echo "hello there" | color hello blue
echo "hello there" | color there green
```
```
echo "hello there" | highlight hello green
echo "hello there" | underline there cyan
```

