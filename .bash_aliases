alias tabname=fc_setTabName $1
fc_setTabName(){
            echo -en "\033]0;$1\a"
}
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
  echo "git pull"
  git pull
  echo "git push"
  git push
  echo "git tag -d $1"
  git tag -d $1
  echo "git push origin :refs/tags/$1"
  git push origin :refs/tags/$1
}

function fc_re_tag(){
  echo "git pull"
  git pull
  echo "git push"
  git push
  echo "git tag -f $1"
  git tag -f $1
  echo "git push -f origin $1"
  git push -f origin $1
}

function fc_staging(){
  echo "git checkout $1"
  git checkout $1
  echo "git pull"
  git pull
  echo "git branch -D $1-staging"
  git branch -D $1-staging
  echo "git checkout -b $1-staging"
  git checkout -b $1-staging
  echo "git pull origin staging"
  git pull origin staging
  echo "git push -u origin $1-staging --force"
  git push -u origin $1-staging --force
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
  if [[ ! -z "$1" ]]
  then
    echo "alias $1='wow'" >> ~/.bash_wow_aliases
    source ~/.bash_wow_aliases
  else
    echo "wow vazio"
  fi
}

function fc_up_pato(){
    echo "cd ~/workspace/homebroker-ws-asset && docker-compose up"
    cd ~/workspace/homebroker-ws-asset && docker-compose up
}

function fc_pato_up(){
  if [ $1 = "beta" ]; then
    echo "pato up asset-beta"
    pato up asset-beta
  else
    echo "pato up asset-support-alpha"
    pato up asset-support-alpha
  fi
}

alias patoup='fc_pato_up'
alias uppato='fc_up_pato'
alias upvm="fc_up_vm2020"
alias upportal="fc_up_portal"
alias vm2020='cd ~/workspace/valebroker-vm2020-asset'
alias portal='cd ~/workspace/portal-carteira'
alias ts='cd ~/workspace/valebroker-vm2020-asset'
alias vmsysadmin='cd ~/workspace/vm-sysadmin/'
alias coldfusion='cd ~/workspace/homebroker-ws-asset'
alias cfc='cd ~/workspace/homebroker-ws-asset'
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
alias psql-dev='PGAPPNAME=brubs PGPASSWORD=Vmb34ol!!23 psql -h 10.3.81.50 -p 5432 -U Valemobi -d Valemobi'
alias query='psql-dev'
alias queyr='query'
alias editworkaliases='code ~/.bash_work_aliases'
alias catworkaliases='cat ~/.bash_work_aliases'
alias editsapo='code ~/.bin/sapo2'

alias wow=fc_wow

alias staging=fc_staging
alias getLastTag=fc_get_last_tag
alias getlasttag=fc_get_last_tag
alias updatealias='source ~/.bash_aliases'
alias tag=fc_tag_git
alias pulinho='git checkout'
alias cd..='cd ..'
alias shame='git blame'
alias bk='  cd ..'
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
alias catworkalias='cat ~/.bash_work_aliases'
alias addwow='fc_add_wow'
alias dotfiles='cd ~/workspace/dotfiles'
alias gti='git'
alias igt='git'
alias wgit='git'
alias wgti='git'
alias wigt='git'
alias please='sudo'
alias pls='please'
alias editworkaliases='code ~/.bash_work_aliases'

if [ -f ~/.bash_wow_aliases ]; then
    . ~/.bash_wow_aliases
fi
if [ -f ~/.bash_work_aliases ]; then
    . ~/.bash_work_aliases
fi
