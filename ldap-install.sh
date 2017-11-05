#!/usr/bin/expect

set timeout 300
spawn apt-get install -y slapd ldap-utils

expect "Administrator password: "
send "password\r"

expect "Confirm password: "
send "password\r"

expect eof

spawn dpkg-reconfigure slapd

expect "Omit"
send "no\r"

expect "DNS domain name: "
send "example.com\r"

expect "Organization name: "
send "example\r"

expect "Administrator password: "
send "password\r"

expect "Confirm password: "
send "password\r"

expect "Database backend to use: "
send "3\r"

expect "database to be removed"
send "no\r"

expect "Move old database?"
send "yes\r"

expect "Allow LDAPv2"
send "no\r"

expect eof