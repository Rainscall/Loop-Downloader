trap 'onCtrlC' INT
function onCtrlC () {
    rm -f testfile.test
    echo -e '\nBye'
    exit 0
}
clear
rm -f testfile.test
rm -f testfile.test.*
clear
curl ipv6.ip.sb -s
if [ $? -eq 7 ]; then
clear
echo -e Your server "\033[41;37m NOT \033[0m" support IPV6!!! 
else
clear
echo -e Your server support IPV6
fi
IPV6=0
echo start test
echo -e press  "\033[41;37m Ctrl+C \033[0m"  to exit
echo -n "Enter your test URL(with http://):"
read  test_URL  
echo -n "Forced use of IPV6?(0 for no, 1 for yes):"
read  IPV6
finished_times=0
if [ $IPV6 -eq 0 ]; then
while :
do
finished_times=$(($finished_times+1))
wget $test_URL -q --show-progress -O /dev/null --no-check-certificate
echo -e  Test "\033[41;37m $finished_times \033[0m" completed
done
elif [ $IPV6 -eq 1 ]; then
while :
do
finished_times=$(($finished_times+1))
wget --inet6-only $test_URL -q --show-progress -O /dev/null --no-check-certificate
echo -e  Test "\033[41;37m $finished_times \033[0m" completed
done
fi
exit 0
