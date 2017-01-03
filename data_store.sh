1. #!/bin/bash
2. cd /home/tamer/recipient/
3. #delete txt file that triggered current bash script
4. rm ./success.txt
5. #start the postgresql server
6. sudo service postgresql start
7. #load all csv's in current folder to postgresql "experiment" db
8. files=`ls *.csv` 
9. for file in $files
10. do
11. csvsql --db postgresql:///experiment --table ${file%.csv} --insert < $file
12. done
13. #catch the exit code
14. a=$?
15. sudo service postgresql stop
16. #exploit it to send email alert in case of failure
17. if (( $a != 0 )) 
18. then 
19. /home/tamer/recipient/email_alert.py
20.  fi
21. 