# Use to color your output text
# Note: 
#  underline also colors the text
#  Bold currently doesn't work

: ' EXAMPLES:

echo "hello there" | red there
echo "hello there" | blue hello | red there

echo "hello there" | color hello blue
echo "hello there" | color there green

echo "hello there" | highlight hello green
echo "hello there" | underline there cyan

'
# Colors from https://wiki.archlinux.org/index.php/Color_Bash_Prompt#List_of_colors_for_prompt_and_Bash
txtblk=`echo -e '\033[30m'` # Black - Regular
txtred=`echo -e '\033[31m'` # Red
txtgrn=`echo -e '\033[32m'` # Green
txtylw=`echo -e '\033[33m'` # Yellow
txtblu=`echo -e '\033[34m'` # Blue
txtpur=`echo -e '\033[35m'` # Purple
txtcyn=`echo -e '\033[36m'` # Cyan
txtwht=`echo -e '\033[37m'` # White
bldblk=`echo -e '\033[30m'` # Black - Bold # Note: bold isn't working
bldred=`echo -e '\033[31m'` # Red
bldgrn=`echo -e '\033[32m'` # Green
bldylw=`echo -e '\033[33m'` # Yellow
bldblu=`echo -e '\033[34m'` # Blue
bldpur=`echo -e '\033[35m'` # Purple
bldcyn=`echo -e '\033[36m'` # Cyan
bldwht=`echo -e '\033[37m'` # White
unkblk=`echo -e '\033[4;30m'` # Black - Underline
undred=`echo -e '\033[4;31m'` # Red
undgrn=`echo -e '\033[4;32m'` # Green
undylw=`echo -e '\033[4;33m'` # Yellow
undblu=`echo -e '\033[4;34m'` # Blue
undpur=`echo -e '\033[4;35m'` # Purple
undcyn=`echo -e '\033[4;36m'` # Cyan
undwht=`echo -e '\033[4;37m'` # White
bakblk=`echo -e '\033[40m'  ` # Black - Background
bakred=`echo -e '\033[41m'  ` # Red
bakgrn=`echo -e '\033[42m'  ` # Green
bakylw=`echo -e '\033[43m'  ` # Yellow
bakblu=`echo -e '\033[44m'  ` # Blue
bakpur=`echo -e '\033[45m'  ` # Purple
bakcyn=`echo -e '\033[46m'  ` # Cyan
bakwht=`echo -e '\033[47m'  ` # White
txtrst=`echo -e '\033[0m'`    # Text Reset

function atoc() {
    # Ascii to color
    # $1 = color
    # $2 = bak / und / txt

    TXT_COLOR=$txtrst
    BAK_COLOR=$txtrst
    UND_COLOR=$txtrst

    case $1 in
        "black" )
            TXT_COLOR=$txtblk
            BAK_COLOR=$bakblk
            UND_COLOR=$undblk;;
        "red" )
            TXT_COLOR=$txtred
            BAK_COLOR=$bakred
            UND_COLOR=$undred;;
        "green" )
            TXT_COLOR=$txtgrn
            BAK_COLOR=$bakgrn
            UND_COLOR=$undgrn;;
        "yellow" )
            TXT_COLOR=$txtylw
            BAK_COLOR=$bakylw
            UND_COLOR=$undylw;;
        "blue" )
            TXT_COLOR=$txtblu
            BAK_COLOR=$bakblu
            UND_COLOR=$undblu;;
        "purple" )
            TXT_COLOR=$txtpur
            BAK_COLOR=$bakpur
            UND_COLOR=$undpur;;
        "cyan" )
            TXT_COLOR=$txtpur
            BAK_COLOR=$bakpur
            UND_COLOR=$undpur;;
        "white" )
            TXT_COLOR=$txtwht
            BAK_COLOR=$bakwht
            UND_COLOR=$undwht;;
    esac

    case $2 in
        "txt" )
            echo $TXT_COLOR;;
        "bak" )
            echo $BAK_COLOR;;
        "und" )
            echo $UND_COLOR;;
    esac
}

function sed_color() {
    # $1 = word to color
    # $2 = color
    # $3 = color2 (Underline/Background)
    # $4 = color3 (Underline/Background)
    sed -e "s/$1/$2$3$4&$txtrst/g"
}

function color() {
    # $1 = word to color
    # $2 = color
    COLOR=`atoc $2 txt`
    sed_color $1 $COLOR
}

function highlight() {
    # $1 = word to highlight
    # $2 = highlight color
    COLOR=`atoc $2 bak`
    sed_color $1 $COLOR
}

function underline() {
    # $1 = word to underline 
    # $2 = underline color
    COLOR=`atoc $2 und`
    sed_color $1 $COLOR
}

function red() { sed_color $1 $txtred; }
function green() { sed_color $1 $txtgrn; }
function yellow() { sed_color $1 $txtylw; }
function blue() { sed_color $1 $txtblu; }
function purple() { sed_color $1 $txtpur; }
function cyan() { sed_color $1 $txtcyn; }
function white() { sed_color $1 $txtwht; }

