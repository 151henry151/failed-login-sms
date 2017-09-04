#!/bin/bash
# 
# Forked from:
# battery_charge: Send SMS when battery is low
# Copyright (C) 2017 Perry Thompson
#
# By Henry Romp on 9-4-2017
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Modify this to include your path, and make sure that your path includes the location of this script
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/henry/Applications/binscripts:/home/yourusername/yourscriptsfolder

# Modify these to your information
# For Verizon it is yourphonenumber@vtext.com
# your provider may do it differently
from="your@email.com"
to="yourphonenumber@vtext.com"
mail_server="mail.yourmailserver.com:465"

failed_login=(grep "FAILED LOGIN" /var/log/auth.log)
failed_logins=$(grep "FAILED LOGIN" /var/log/auth.log)


things () {
echo "EHLO localhost"
sleep 2
echo "AUTH LOGIN"
sleep 2

# Make a base64 of your username with command
# echo -ne 'yourusername' | base64
echo "yourbase64username"
sleep 2

# And same for password
echo "yourbase64password"
sleep 3

echo "MAIL FROM: $from"
echo "RCPT TO: $to"
sleep 2
echo "DATA"
sleep 2
echo "From: $from"
echo "To: $to"
echo "Date: $(date -R)"
echo "Message-ID: <$RANDOM.$RANDOM@$(hostname -f)>"
echo "Subject: Failed Login Attempt"
echo ""
echo "$failed_logins" 
echo "."
echo "quit"
}

if "${failed_login[@]}" ; then 
	things | openssl s_client -quiet -servername "${mail_server%:*}" -crlf -connect "$mail_server"
fi

# Add a cron job for this script
# run it as "sg adm ./thisscript"
# You will need to add your user to the adm group to do it this way

