#!/bin/bash

gcc tester.c

for i in 1; do
  # Define the input arguments
  makefile="../Makefile"
  wrong_makefile="../Makefil"
  command1="\"cat\""
  command2="\"wc -l\""
  command3="\"wc\""
  command4="\"ls\""
  command5="\"ls -l\""
  command6="\"ls ./\""
  command7="\"grep make\""
  command8="\"ls -la\""
  wrong_command1="\"asd\""
  wrong_command2="\"dsa\""
  empty_command="\"\""
  onepace_command="\" \""
  morespace_command="\"         \""
  spacetab_command="\"  	  	\""
  commandpath="\"/bin/cat\""
  command_wrongpath="\"bin/cat\""
  command_wrongpath2="\"/cat\""
  script="\"./asd.sh\""
  wrongscript="\"asd.sh\""
  scriptwithspace="\"./asd space.sh\""
  noaccessscript="\"./noaccess.sh\""
  folder_path="\"testfiles/./asd.sh\""
  tester="./a.out 2>/dev/null"

#   test 1
  test1="$tester $makefile $command1 $command1 results/outfile1"
#   test 2
  test2="$tester $makefile $command1 $command2 results/outfile2"
#   test 3
  test3="$tester $makefile $command6 $command1 results/outfile3"
#   test 4
  test4="$tester $makefile $command1 $command6 results/outfile4"
#   test 5
  test5="$tester $makefile $wrong_command1 $wrong_command2 results/outfile5"
#   test 6
  test6="$tester $makefile $command1 $command8 results/outfile6"
#   test 7
  test7="$tester $makefile $command7 $command1 results/outfile7"
#   test 8
  test8="$tester $makefile $command7 $command1 results/outfile8"
#   test 9
  test9="$tester $makefile $onespace_command $command8 results/outfile9"
#   test 10
  test10="$tester $makefile $command1 $morespace_command results/outfile10"
#   test 11
  test11="$tester $makefile $command4 $command1 results/outfile11"
#   test 12
  test12="$tester $makefile $empty_command $command8 results/outfile12"
#   test 13
  test13="$tester $makefile $wrong_command1 $command4 results/outfile13"
#   test 14
  test14="$tester $makefile $wrong_command2 $command1 results/outfile14"
#   test 15
  test15="$tester $wrong_makefile $command1 $command1 results/outfile15"


#   test 16
  test16="$tester $wrong_makefile $wrong_command1 $command1 results/outfile16"
#   test 17
  test17="$tester $makefile $command1 testfiles/$script results/outfile17"
#   test 18
  test18="$tester $makefile $command1 testfiles/$wrongscript results/outfile18"
#   test 19
  test19="$tester $makefile $command1 testfiles/$scriptwithspace results/outfile19"
#   test 20
  test20="$tester $makefile $command1 testfiles/$noaccessscript results/outfile20"
  # Run the tester
#   test 21
  test21="$tester $makefile $command1 $folder_path results/outfile21"
test

  # Read the output of the tester
  result1=$(eval "$test1")
  result2=$(eval "$test2")
  result3=$(eval "$test3")
  result4=$(eval "$test4")
  result5=$(eval "$test5")
  result6=$(eval "$test6")
  result7=$(eval "$test7")
  result8=$(eval "$test8")
  result9=$(eval "$test9")
  result10=$(eval "$test10")
  result11=$(eval "$test11")
  result12=$(eval "$test12")
  result13=$(eval "$test13")
  result14=$(eval "$test14")
  result15=$(eval "$test15")

  result16=$(eval "$test16")
  result17=$(eval "$test17")
  result18=$(eval "$test18")
  result19=$(eval "$test19")
  result20=$(eval "$test20")
  result21=$(eval "$test21")

  echo -e "		  \033[1;31m ██▓███▒░░▒██▒░ ██▓███▒░██████▒░▒██▒░▒██▒░\033[0m"
  echo -e "		  \033[1;31m▓██▒░░██▒░▒██▒░▓██▒░░██▒██▒░░░░░░▒██░██▒░\033[0m"
  echo -e "		  \033[1;31m▓██▒░██▓▒░▒██▒░▓██▒░██▓▒████▒░░░░░▒███▒░\033[0m"
  echo -e "		  \033[1;31m▒██▄█▓▒ ▒░▒██▒░▒██▄█▓▒ ▒██▒░░░░░░▒██░██▒░\033[0m"
  echo -e "		  \033[1;31m▒██▒ ░  ░░▒██▒░▒██▒ ░  ░██████▒░▒██▒░▒██▒░\033[0m"
  echo -e "		  \033[1;31m▒▓▒░ ░  ░░▒▓▓▒░▒▓▒░ ░ ░░░▒▓▓▓▓▒░ ▒▓▓▒ ▒▓▓▒\033[0m"
  echo -e "		  \033[1;31m░▒ ░      ░▒▒░ ░▒ ░  ░ ░  ░▒▒░   ░▒▒░ ░▒░\033[0m"
  echo -e "		  \033[1;31m░░         ░░  ░░      ░   ░░     ░░   ░\033[0m"
  echo -e "		  \033[1;31m░          ░   ░            ░     ░\033[0m"

  echo -e "\n                           \033[1;4;96mPIPEX Tester By: zstenger\033[0m"
  echo -e "                                   \033[1;4;30mmandatory:\033[0m"

  # Check the result and display it
  if [ "$result1" == "Test passed: Output is as expected" ]; then
    echo -e -n "\033[1;92m1.OK \033[0m"
  else
    echo -e -n "\033[1;31m1.KO \033[0m"
  fi
  if [ "$result2" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m2.OK \033[0m"
  else
    echo -e -n "\033[1;31m2.KO \033[0m"
  fi
  if [ "$result3" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m3.OK \033[0m"
  else
    echo -e -n "\033[1;31m3.KO \033[0m"
  fi
  if [ "$result4" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m4.OK \033[0m"
  else
    echo -e -n "\033[1;31m4.KO \033[0m"
  fi
#   your pipex expected output:
# pipex: asd: command not found
# pipex: dsa: command not found
  if [ "$result5" == "" ]; then
	echo -e -n "\033[1;92m5.OK \033[0m"
  else
    echo -e -n "\033[1;31m5.KO \033[0m"
  fi
  if [ "$result6" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m6.OK \033[0m"
  else
    echo -e -n "\033[1;31m6.KO \033[0m"
  fi
  if [ "$result7" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m7.OK \033[0m"
  else
    echo -e -n "\033[1;31m7.KO \033[0m"
  fi
  if [ "$result8" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m8.OK \033[0m"
  else
    echo -e -n "\033[1;31m8.KO \033[0m"
  fi
  #   your pipex expected output:
#   pipex: command not found:
  if [ "$result9" == "" ]; then
	echo -e -n "\033[1;92m9.OK \033[0m"
  else
    echo -e -n "\033[1;31m9.KO \033[0m"
  fi
  #   your pipex expected output:
#   pipex: command not found:
  if [ "$result10" == "pipex: command not found:           " ]; then
	echo -e -n "\033[1;92m10.OK \033[0m"
  else
    echo -e -n "\033[1;31m10.KO \033[0m"
  fi
  if [ "$result11" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m11.OK \033[0m"
  else
    echo -e -n "\033[1;31m11.KO \033[0m" 
  fi
  if [ "$result12" == "pipex: Permission denied:" ]; then
	echo -e -n "\033[1;92m12.OK \033[0m"
  else
    echo -e -n "\033[1;31m12.KO \033[0m"
  fi
  if [ "$result13" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m13.OK \033[0m"
  else
    echo -e -n "\033[1;31m13.KO \033[0m"
  fi
  if [ "$result14" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m14.OK \033[0m"
  else
    echo -e -n "\033[1;31m14.KO \033[0m"
  fi
  if [ "$result15" == "Test passed: Output is as expected" ]; then
	echo -e "\033[1;92m15.OK \033[0m"
  else
    echo -e "\033[1;31m15.KO \033[0m"
  fi


  if [ "$result16" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m16.OK \033[0m"
  else
    echo -e -n "\033[1;31m16.KO \033[0m"
  fi
  if [ "$result17" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m17.OK \033[0m"
  else
    echo -e -n "\033[1;31m17.KO \033[0m"
  fi
  if [ "$result18" == "Test passed: Output is as expected" ]; then
	echo -e -n "\033[1;92m18.OK \033[0m"
  else
    echo -e -n "\033[1;31m18.KO \033[0m"
  fi
#   script file with a space in the name
  if [ "$result19" == "" ]; then
	echo -e -n "\033[1;92m19.OK \033[0m"
  else
    echo -e -n "\033[1;31m19.KO \033[0m"
  fi
# script with no execute permission
  if [ "$result20" == "" ]; then
	echo -e -n "\033[1;92m20.OK \033[0m"
  else
    echo -e -n "\033[1;31m20.KO \033[0m"
  fi
  if [ "$result21" == "Test passed: Output is as expected" ]; then
	echo -e "\033[1;92m21.OK \033[0m"
  else
    echo -e "\033[1;31m21.KO \033[0m"
  fi
  echo -e "                                     \033[1;4;30mbonus:\033[0m"

done
echo -e ""