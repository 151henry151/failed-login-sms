# Sends an SMS to you if there are any failed login attempts

# Forked from:
# battery_charge: Send SMS when battery is low
# Copyright (C) 2017 Perry Thompson

# Modified and redistributed by Henry Romp
# on 9-4-2017

# USAGE:
# Insert your information, for example for verizon you use 
# your phone number at vtext.com
# Insert your base64 username
# Made with command echo -ne 'yourusername' | base64
# Insert your base64 password
# Made with command echo -ne 'yourpassword' | base64
# Make a cron job to run the script periodically
# Call the script with "sg adm ./scriptname" in your cron job
# You will need to add the user to the adm group

