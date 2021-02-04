#!/bin/bash

##########################
# Environment variables
##########################
thunked_ssh_folder=~/.ssh
thunked_config_file=${thunked_ssh_folder}/config
thunked_configs_folder=${thunked_ssh_folder}/configs

# set as appropriate
#thunked_winUserDir=''

thunked_cheatSheetGetter(){
  [ "$2" = "e" ] && vi "$1" || less "$1"
}
thunked_teleporter(){
  if [ "$2" = "e" ] || [ "$2" = "echo" ]; then 
    printf "$1" 
  else
    echo "Porting to "$1"... " 
    cd "$1"
  fi
}
thunked_castBar(){
  local counter=20
  local l=0
  for (( l; l <= counter; ++l )); do
    printf -v castbar '%-*s%0*d' "$l" '' $((counter-l)) ''
    castbar=${castbar// /#}
    castbar=${castbar//0/-}
    printf '%8s: [%.*s%s]' "$1" "$counter" "$castbar"
    (( l < counter )) && printf '\r' || printf '\n'
    sleep .2s
  done
}

##########################
# Begin system args(1) switch
##########################
case "$1" in

  ##########################
  # SSH config file manipulation
  ##########################
  s) ;&
  switch)
    case "$2" in
      a) ;&
      active)
        echo "Active config file:"
        head -n 1 "$thunked_config_file"
      ;;

      g) ;&
      github)
        echo "Switching config file to GitHub..."
        cp -v "${thunked_configs_folder}/github" "$thunked_config_file"
      ;;

      m) ;&
      misc)
        echo "Switching config file to Misc..."
        cp -v "${thunked_configs_folder}/misc" "$thunked_config_file"
      ;;


      *)
        echo ''
        echo 'thunked (s)witch <command>'
        echo ''
        echo "### COMMANDS ###"
        echo "(a)ctive :: Display the current active AWS environment"
        echo "(g)ithub :: Switch Git config to ECG GitHub"
        echo "(m)isc :: Switch Git config to Misc"
        echo ''
      ;;
    esac
  ;;

  ##########################
  # SSH connections
  ##########################
  c) ;&
  connect)
    case "$2" in
      pi)
        echo "Connecting to the local web server..."
        ssh pi@192.168.0.1
      ;;

      *)
        echo ''
        echo 'thunked (c)onnect <destination>'
        echo ''
        echo "### DESTINATIONS ###"
        echo "pi :: Open an SSH connection to the Pi"
        echo ''
      ;;
    esac
  ;;


  ##########################
  # Local system directory shortcuts
  ##########################
  p) ;&
  port) ;&
  portal)
    case "$2" in
      u) ;&
      user)
        thunked_teleporter "${thunked_winUserDir}/" $3
      ;;

      dt) ;&
      desktop)
        thunked_teleporter "${thunked_winUserDir}/Desktop/" $3
      ;;

      dl) ;&
      downloads)
        thunked_teleporter "${thunked_winUserDir}/Downloads/" $3
      ;;

      cs) ;&
      cheatsheets)
        thunked_teleporter "$(th portal work e)cheat_sheets/" $3
      ;;

      h) ;&
      hearth)
        thunked_castBar "Bubble" 6
        thunked_castBar "Hearth" 6
        cd
      ;;

      *)
        echo ''
        echo 'thunked (p)ortal <destination> [(e)cho]'
        echo ''
        echo "### DESTINATIONS ###"
        echo "(cs) cheatsheets"
        echo "(dl) downloads"
        echo "(dt) desktop"
        echo "(h)earth"
        echo "(u)ser"
        echo ''
      ;;
    esac
  ;;

  ##########################
  # Postgres helpers
  ##########################
  pg) ;&
  postgres)
    case "$2" in
	  fix)
		if [ ! -d /var/run/postgresql ]; then
			sudo mkdir /var/run/postgresql
			sudo chown postgres: /var/run/postgresql
		else
			echo "Already fixed dawg"
		fi
	  ;;

      *)
        echo ''
        echo 'thunked (pg)postgres <command>'
        echo ''
        echo '### COMMANDS ###'
		echo 'fix'
      ;;
    esac
  ;;

  ##########################
  # File editor shortcuts
  ##########################
  e) ;&
  edit)
    case "$2" in
      h) ;&
      hosts)
        vi /mnt/c/Windows/System32/drivers/etc/hosts
      ;;

      th) ;&
      thunked)
        vi ~/scripts/thunked.sh
      ;;

      b) ;&
      bashrc)
        vi ~/.bashrc
      ;;

      v) ;&
      vimrc)
        vi "$(thunked portal user e)_vimrc"
      ;;

      *)
        echo ''
        echo 'thunked (e)dit <file>'
        echo ''
        echo "### FILES ###"
        echo "(h)osts"
        echo "(th)unked"
        echo "(b)ashrc"
        echo "(v)imrc"
        echo ''
      ;;
    esac
  ;;

  ##########################
  # Cheat sheet shortcuts
  ##########################
  cs) ;&
  cheatsheet)
    case "$2" in
      a) ;&
      aws)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_aws.txt" "$3"
      ;;

      c) ;&
      css)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_css.txt" "$3"
      ;;

      g) ;&
      git)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_git.txt" "$3"
      ;;

      j) ;&
      java)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_java.txt" "$3"
      ;;

      js) ;&
      javascript)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_javascript.txt" "$3"
      ;;

      l) ;&
      linux)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_linux.txt" "$3"
      ;;

      num) ;&
      numericbases)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_numericbases.txt" "$3"
      ;;

      p) ;&
      php)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_php.txt" "$3"
      ;;

      s) ;&
      sql)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_sql.txt" "$3"
      ;;

      wp) ;&
      wordpress)
        thunked_cheatSheetGetter "$(thunked portal cheatsheets e)/cs_wordpress.txt" "$3"
      ;;

      *)
        echo ''
        echo 'thunked (cs)cheatsheet <target>'
        echo ''
        echo "### FILES ###"
        echo "(a)ws"
        echo "(c)ss"
        echo "(g)it"
        echo "(j)ava"
        echo "(js) javascript"
        echo "(l)inux"
        echo "(num)ericbases"
        echo "(p)hp"
        echo "(s)ql"
        echo "(wp) wordpress"
        echo ''
      ;;
    esac
  ;;

  ##########################
  # AWS cli shortcuts
  ##########################
  a) ;&
  aws)
    case "$2" in
      get-lambda)
        if [ -z "$3" ]; then
          echo "Provide a function name"
        else
          thunked_awsLambdaURL=$(aws lambda get-function --function-name "$3" | sed -n 's/.*"Location": \?"\([^"]*\)"/\1/p')
          [ -n $thunked_awsLambdaURL ] && wget -O "${3}.zip" "$thunked_awsLambdaURL" || echo "No lambda found"
          unset thunked_awsLambdaURL
        fi
      ;;

      *)
        echo ''
        echo 'thunked (a)ws <command> <option>'
        echo ''
        echo '### Commands ###'
        echo 'get-lambda <function-name>'
        echo ''
      ;;
    esac
  ;;

  ##########################
  # Helper shortcuts
  ##########################
  m) ;&
  misc)
    case "$2" in
      pass) ;&
      password_gen)
        thunkedTmpCounter=0
        while [ $thunkedTmpCounter -lt 6 ]; do
          head -c 16 /dev/urandom | xxd -g0 | cut -d ' ' -f2
          let thunkedTmpCounter=thunkedTmpCounter+1
        done
        unset thunkedTmpCounter
      ;;

      fill)
        x=0
        while [ $x -lt 100 ]; do
          th misc pass
          sleep 1
          let x=x+1
        done
        unset x
      ;;

      bash_colors)
        echo '\e\[_;3_m\]'
        echo '(option 1: 0|1 reg|bold)'
        echo '(option 2: [0-7] see colors below)'
        for c in {0..7}; do
          printf '%s: \e[0;3%smtest \e[1mtest\e[0m\n' $c $c;
        done
      ;;

      mount)
        sudo mount -t drvfs d: /mnt/d
      ;;

      o) ;&
      open)
        explorer.exe .
      ;;

      cycle_keys)
          echo "Not implemented"
#          cd ~/.ssh
#          for thunked_key_file in 'x' 'y'; do
#            echo $thunked_key_file
#            [-a ./"${thunked_key_file}"] \
#              && mv -vi "${thunked_key_file}" ./old_keys/"$(date +'%f')_${thunked_key_file}"
#            [-a ./"${thunked_key_file}.pub"] \
#              && mv -vi "${thunked_key_file}.pub" ./old_keys/"$(date +'%f')_${thunked_key_file}.pub"
#            [!-a ./"${thunked_key_file}"] && [!-a ./"${thunked_key_file}.pub" \
#              && echo Creating key for: "$thunked_key_file \
#              && ssh-keygen -f "$thunked_key_file"
#          done
#          echo "Remember to upload these keys to wherever is relevant"
#          unset thunked_key_file
      ;;

      *)
        echo ''
        echo 'thunked (m)isc <command>'
        echo ''
        echo '(o)pen (windows explorer)'
        echo '(pass)word_gen'
        echo 'bash_colors'
        echo 'cycle_keys'
        echo 'fill'
        echo 'mount'
      ;;
    esac
  ;;
    
  ##########################
  # Helper info
  ##########################
  *)
    echo ''
    echo "Thunked's Mage Service :: Use to open a portal to your destination"
    echo ''
    echo "### USAGE ###"
    echo "thunked <command> <target>"
    echo "Specify <command> without a <target> to display information about that command's subcommands"
    echo ''
    echo "(a)ws <target> <options> :: Run the aws command with options"
    echo "(c)onnect <target> :: Open an SSH connection to the designated target"
    echo "(cs) cheatsheet <target> :: Open the requested cheat sheet (in less)"
    echo "(cs) cheatsheet <target> e :: Open the requested cheat sheet (in vim)"
    echo "(e)dit <target> :: Edit common or annoying-to-get-to files"
    echo "(p)ort <target> (e)cho :: Print the portal target"
    echo "(p)ort <target> :: Portal the designated target"
    echo "(pg) postgres <target> :: Postgres helpers for the designated target"
    echo "(s)witch <target> :: Switch the AWS config file to the designated target"
    echo '(m)isc <target> :: Misc helper functions'
    echo ''
  ;;

##########################
# End system args(1) case
##########################
esac

##########################
# Keep vars local
##########################
unset thunked_ssh_folder
unset thunked_config_file
unset thunked_configs_folder
unset thunked_winUserDir
unset thunked_cheatSheetGetter
unset thunked_teleporter
unset thunked_castBar

