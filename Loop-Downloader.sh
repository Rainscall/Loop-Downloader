clear
rm -f testfile.test
rm -f testfile.test.*
clear
echo start test
echo -e press  "\033[41;37m Ctrl+C \033[0m"  to exit
echo -n "Enter your test URL(with http://):"
read  test_URL   
finished_times=0
while :
do
finished_times=$(($finished_times+1))
wget $test_URL -q --show-progress -O testfile.test
rm testfile.test
echo -e  Test "\033[41;37m $finished_times \033[0m" completed
done
exit 0
