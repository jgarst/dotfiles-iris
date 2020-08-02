# instantiate machine specific environment variables
localenv="${ZDOTDIR}/`/usr/bin/hostname`.zshenv"

if [ -f "$localenv" ]
then
    source "$localenv"
fi

export XDG_CONFIG_HOME=${HOME}/config
export XDG_DATA_HOME=${HOME}/local/share
export XDG_CONFIG_HOME=${HOME}/config
export XDG_CACHE_HOME=${HOME}/cache
export XDG_DATA_DIRS=/usr/local/share/:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

export PASSWORD_STORE_DIR=${HOME}/pass

export EDITOR=nvim
export GOPATH=${HOME}/go
export BROWSER=/usr/bin/firefox

export PATH=${HOME}/bin:${PATH}
export PYTHONPATH=${HOME}/lib/python
export IPYTHONDIR=${XDG_DATA_HOME}/ipython
export JUPYTER_CONFIG_DIR=${XDG_DATA_HOME}/jupyter

export HISTFILE=${XDG_DATA_HOME}/shell_history
export HISTSIZE=100000
export SAVEHIST=${HISTSIZE}

export SQLITE_HISTORY=${XDG_DATA_HOME}/sqlite_history

export NOTMUCH_CONFIG=${HOME}/config/notmuch-config

export CARGO_HOME=${XDG_DATA_HOME}/cargo

export GNUPGHOME=${XDG_DATA_HOME}/gnupg

export XINITRC=${XDG_CONFIG_HOME}/X11/xinitrc
export XSERVERRC=${XDG_CONFIG_HOME}/X11/xserverrc

export PSQLRC=${XDG_CONFIG_HOME}/pg/psqlrc
export PSQL_HISTORY=${XDG_CACHE_HOME}/pg/psql_history
export PGPASSFILE=${XDG_CONFIG_HOME}/pg/pgpass
export PGSERVICEFILE=${XDG_CONFIG_HOME}/pg/pg_service.conf

export NO_UPDATE_NOTIFIER=true

export CHROME_CONFIG_HOME=${XDG_DATA_HOME}

export RBENV_ROOT=${XDG_DATA_HOME}/rbenv

export BUNDLE_USER_CONFIG=${XDG_CONFIG_HOME}/bundle
export BUNDLE_USER_CACHE=${XDG_CACHE_HOME}/bundle
export BUNDLE_USER_PLUGIN=${XDG_DATA_HOME}/bundle

export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
