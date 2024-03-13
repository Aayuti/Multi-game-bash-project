#!/bin/bash
start_test ()
{
    header
    echo -e "1) \e[32mTake the Test\e[0m"
    echo -e "2) \e[31mExit\e[0m"
    echo
    read -p "Enter your choice: " choice 
    line=$(wc -l < question_bank.txt)  # checking the line number of question_bank.txt file
    
    case $choice in
        1)
            for i in $(seq 5 5 $line) # starting i value is 5 & it will increase by 5 in each iteration
            do
                header
                echo
                head -$i question_bank.txt | tail -5  # display the 5 lines of question_bank.txt
                echo
                for j in $(seq 10 -1 1)
                do
                    echo -e "\r\e[31mEnter the correct answer\e[0m \e[32m$j\e[0m : \c" # '\r' carriage return '\c' cursor will not move to the new line.
                    read -t 1 ans # '-t' enables the timer for 1 second & 'ans' takes the user input
                    if [ ${#ans} -ne 0 ]
                    then
                        break
                    fi  
                done
                
                if [ ${#ans} -eq 1 ]
                then
                    echo "$ans" >> user_answer.txt  # user answer is stored inside the user_answer.txt file
                else
                    echo "No_Answer" >> user_answer.txt # if the user does not give any input, then by default 'No_Answer' will be stored inside the file
                fi
                echo
            done
            results
            ;;
        
        2)
            exit
            ;;
        
        *) echo -e "\e[31mPlease choose the correct option.\e[0m"
           start_test
    esac
}

results ()
{
    header
    c_ans=( $(cut -d ':' -f1 correct_answer.txt) ) # 'c_ans' variable stores the first field of the content of 'currect_answer.txt' file
    c_ans1=( $(cut -d ':' -f2 correct_answer.txt) ) # 'c_ans1' variable stores the 2nd field of the content of 'currect_answer.txt' file
    u_ans=( $(tail -5 user_answer.txt) ) # 'u_ans' variable stores the last 5 lines of 'user_answer.txt' file
    score=0

    for i in $(seq 0 $((${#c_ans[@]}-1)))
    do
        if [ ${c_ans[i]} = ${u_ans[i]} ] # checking the user's answer with the correct answer
        then
            echo -e "Q$(($i+1))) Your answer is : \e[32m${c_ans[i]} (Correct)\e[0m"
            echo -e "\e[32mQ$(($i+1)))\e[0m \e[34mCorrect answer is :\e[0m \e[32m${c_ans[i]}. ${c_ans1[i]}\e[0m"
            echo
            score=$(($score+1)) # if the condition is true then the score value will increase by 1
        else
            echo -e "Q$(($i+1))) Your answer is : \e[31m${u_ans[i]} (Incorrect)\e[0m"
            echo -e "\e[32mQ$(($i+1)))\e[0m \e[34mCorrect answer is :\e[0m \e[32m${c_ans[i]}. ${c_ans1[i]}\e[0m"
            echo
        fi
    done
    echo -e "\e[32mYour Total Score\e[0m: $score Marks"
    echo
    exit
}

header ()
{
    sleep 2s  # it will wait for 2 seconds  
    clear  # after 2 seconds it will clear the display
    echo __________________
    echo
    echo -e "\e[31mTotal Marks\e[0m : 5                    \e[31mTime\e[0m : 50 Seconds"
    echo __________________
}

welcome ()
{
    start_test
}

welcome