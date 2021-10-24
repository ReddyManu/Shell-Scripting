Print() {
  echo -n -e "\e[1m$1\e[0m ... "
  echo -e "\n\e[36m ========================== $1 ==========================\e[0m" >>$LOG
}
## In previous commit, created, above echo command without \n, which did not give space(next line) between Installing, Enabling, and Starting Nginx headings

Stat() {
  if [ $? -eq 0 ]
  then
    echo -e "\e[1;32mSUCCESS\e[0m"
  else
    echo -e "\e[1;31mFAILURE\e[0m"
    echo -e "\e[1;33mScript Failed and check the detailed log in $LOG file\e[0m"
    exit

  fi
}

LOG=/tmp/roboshop.log
rm -f $LOG