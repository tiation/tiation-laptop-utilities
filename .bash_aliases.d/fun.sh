# Fun terminal message
alias sayhi='echo "Hi, $(whoami)! Stay awesome!"'

# Weather lookup
alias weather='curl wttr.in'

# Convert units
function c2f() {
    echo "$1 * 1.8 + 32" | bc
}
function f1spd() {
    echo "$1 * 0.621371" | bc
}
alias convert-c2f='c2f'
alias convert-f1spd='f1spd'
