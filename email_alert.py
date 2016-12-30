1. #!/usr/bin/env python3
2. import yagmail
3. yag=yagmail.SMTP("USERNAME@gmail.com", "PASSWORD")
4. yag.send(to="USERNAME@HOST.com", subject="Experiment 4 Problems! Failed to upload CSV's to DB") 
5. yag.close()