function fc_get_last_tag(){
  LIMIT=$2
  if [[ -z "$LIMIT" ]]
  then
    LIMIT="1"
  fi
  git for-each-ref --format='%(*committerdate:raw)%(committerdate:raw) %(refname) %(*objectname) %(objectname)' refs/tags | \
  sort -n | awk '{ print $4, $3; }' | sed -e 's!refs/tags/!;!g' | tr ";" "\n" | grep $1 | tail -$LIMIT
}

function fc_tag_git() {
  echo git pull
  git pull
  COMMIT="-$(git log --pretty=format:'%h' -n 1)"
  TAG="$1""$COMMIT"
  echo git push
  git push
  echo "git tag -a" "$TAG" "-m '""$2""'"
  git tag -a "$TAG" -m "$2"
  echo git push origin $TAG
  git push origin $TAG
}

function fc_un_tag(){
  echo git pull
  git pull
  echo git push
  git push
  git tag -d $1
  git push origin :refs/tags/$1
}

function fc_re_tag(){
  echo git pull
  git pull
  echo git push
  git push  
  git tag -f $1
  git push -f origin $1
}

function fc_get_present_branch() {
    HEAD = cat .\.git\HEAD
    SPLIT = $HEAD | tr 'refs/heads/' '\n'
    BRANCH = $SPLIT[1]
    BRANCH
}

function fc_wow() {
  git status || ls
}

function fc_new_branch() {
  git checkout -b $1
  git push -u origin $1
}

function fc_program_is_runnig(){
  command=$*
  running=$(ps ax | grep -v grep | grep "$command" | wc -l)
  if [ "$running" -gt 0 ]; then
      echo "1"
  else
      echo "0"
  fi
}

function fc_add_wow(){
  echo "alias $1='wow'" >> ~/.bash_wow_aliases
  source ~/.bash_wow_aliases
}

function fc_up_sapo(){
  SAPO_UP=$(fc_program_is_runnig sapo)
  if [ "$SAPO_UP" -eq 0 ]; then
    echo "cd ~/workspace && /home/$USER/.bin/sapo2 up asset --no-wait"
    cd ~/workspace && /home/$USER/.bin/sapo2 up asset --no-wait
  fi
}

alias vm2020='cd ~/workspace/vm2020-front-html/'
alias vm202=vm2020
alias vm20=vm2020
alias vmsysadmin='cd ~/workspace/vm-sysadmin/'
alias vmdevel='cd ~/workspace/vm-developer/'
alias coldfusion='cd ~/workspace/valebroker-coldfusion/'
alias flexextras='cd ~/workspace/valebroker-flex-extras/'
alias flexweb='cd ~/workspace/valebroker-flex-web/'
alias portfoliomanager='cd ~/workspace/PortfolioManager'
alias quebroDev='sh ~/workspace/quebro_o_dev.sh'
alias sysadmin='cd ~/workspace/vm-sysadmin/'
alias cdhomolog='ssh bruno.ribeiro.homolog@homolog.valebroker.com.br'
alias logs='cd ~/workspace/.sapo/valebroker/content/WEB-INF/railo/logs/'
alias sapo='cd ~/workspace && /home/$USER/.bin/sapo'
alias sapo2='cd ~/workspace && /home/$USER/.bin/sapo2'
alias upsapo='fc_up_sapo'
alias sl='ls'
alias heloa='ssh root@10.1.1.212'
alias risco='cd ~/workspace/risco'
alias bitcoin='cd ~/workspace/bitcoin'
alias ors='cd ~/workspace/ors'
alias flexair='cd ~/workspace/valebroker-flex-air'
alias vimsapo='vim ~/.bin/sapo'
alias adm_concierge='cd ~/workspace/adm_concierge'
alias zap_route_script='cd ~/workspace/zap-route-script'
alias zapdev='ssh bruno@10.1.1.141'
alias omni-connector='cd ~/workspace/omni-connector'
alias zapdesk='ssh admconcierge@zapdesk.com.br'
alias zap-monitor='cd ~/workspace/zap-monitor'
alias zap-facebook-tab='cd ~/workspace/zap-facebook-tab'
alias coreback='cd ~/workspace/corretora-core-back'
alias corefront='cd ~/workspace/corretora-core-front'
alias portal='cd ~/workspace/portal-valemobi/'
alias psql-dev='PGAPPNAME=brubs PGPASSWORD=Vmb34ol!!23 psql -h 10.3.81.50 -p 5432 -U Valemobi -d Valemobi'
alias query='psql-dev'
alias queyr='query'
alias editworkaliases='code ~/.bash_work_aliases'
alias catworkaliases='cat ~/.bash_work_aliases'
alias editsapo='code ~/.bin/sapo2'

alias wow=fc_wow

alias getLastTag=fc_get_last_tag
alias getlasttag=fc_get_last_tag
alias updatealias='source ~/.bash_aliases'
alias tag=fc_tag_git
alias pulinho='git checkout'
alias cd..='cd ..'
alias shame='git blame'
alias bk='cd ..'
alias editalias='code ~/.bash_aliases'
alias calc='gnome-calculator'
alias git-pronto='git pull && git push'
alias desce='git pull'
alias sobe='git add'
alias empina='git commit'
alias rebola='git push'
alias untag='fc_un_tag'
alias retag='fc_re_tag'
alias update-vm="git pull origin asset_alpha"
alias sl='ls'
alias achar_texto='grep -Rl $1 --color=never'
alias achar_arquivo='find . | grep $1'
alias workspace='cd ~/workspace'
alias catalias='cat ~/.bash_aliases'
alias addwow='fc_add_wow'
alias dotfiles='cd ~/workspace/dotfiles'
alias runvm='vm2020 && npm run local'
alias newvm='vm2020 && npm install:clean'

. ~/.bash_wow_aliases
. ~/.bash_work_aliases
