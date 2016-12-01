#!/usr/bin/expect

# example ./tool.sh test => login test jump server
# example ./tool.sh pro => login pro jump server
# example ./tool.sh test 1 => login test 1 server
# example ./tool.sh pro  2 => login pro 2 server

set timeout 5
set jumpserver `your remote ip`
set port 8888
set username `your account, like benkang`
set userpasswd ""
set testServer test
set proServer pro
 # means your login type, test or pro
set type  [lindex $argv 0]
 # means which server
set index [lindex $argv 1]

if { $type != $testServer && $type != $proServer } {
  puts 'input error. should input param like `test` or `pro`, for example, ./tool.sh test'
  exit
}
spawn ssh -p $port $username@$jumpserver

expect {
 "*assword:" { send "$userpasswd\r" }
}

set testuser  `ypur testacount, like benkang`
# u should complete this testpasswd
set testpasswd `your testpassword`
set test1 `your remote testserver 1 ip`
set test2 `your remote testserver 2 ip`

set prouser `ypur proacount, like benkang`
# u should complete this propasswd
set propasswd `your propassword`
set pro1 `your remote production server`
set pro2 `your remote production server`
set pro3 `your remote production server`
set pro4 `your remote production server`

# hanle all test servers
if { $type == $testServer } {
  puts "Begin connect test server $index ..."
  expect "* from *"
  send "su $testuser\r"
  expect {
    "*assword:" { send "$testpasswd\r"  }
  }
  # expect "pro*@"
  expect "`your server account`*@"
  if {$index == 1} {
    send "ssh $prouser@$test1\r"
  }
  if {$index == 2} {
    send "ssh $prouser@$test2\r"
  }
  if {$index != 1 && $index != 2} {
    puts 'go to jump test server'
  }
}

if { $type == $proServer } {
  puts "Begin connect pro server $index  ..."
  expect "* from *"
  send "su $prouser\r"
  expect {
    "*assword:" { send "$propasswd\r"  }
  }
  expect "`your server account`*@"
  if {$index == 1} {
    send "ssh $prouser@$pro1\r"
  }
  if {$index == 2} {
    send "ssh $prouser@$pro2\r"
  }
  if {$index == 3} {
    send "ssh $prouser@$pro3\r"
  }
  if {$index == 4} {
    send "ssh $prouser@$pro4\r"
  }
  if {$index != 1 && $index != 2 && $index != 3 && $index != 4} {
    puts 'go to jump pro server'
  }
}


interact
