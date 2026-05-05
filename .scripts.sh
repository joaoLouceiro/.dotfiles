# Autodetect window width and adapt $MANWIDTH to it.
# There's some weird padding issue that's breaking the wrapping of the text, so I am preemptively removing 8 columns from it.
man() {
    local width=$(($(tput cols) - 8))
    [ -n "$MANWIDTH" ] && [ $width -gt $MANWIDTH ] && width=$MANWIDTH
    env MANWIDTH=$width \
        man "$@"
}

fzf_to_dir() {
    local selected_dir
    selected_dir=$(fd --exact-depth 1 --exclude node_modules -t d . "$1" | fzf +m --height 50% --preview 'tree -C -I node_modules -I target {}')
    if [[ -n "$selected_dir" ]]; then
        # Change to the selected directory
        cd "$selected_dir" || return 1
    fi
}

function fzf_docker_start() {
    local output
    local header
    local selected_container

    output="$(docker ps -a --format 'table {{.Names}}\t{{.ID}}\t{{.Ports}}\t{{.Status}}')"
    header="$(echo "$output" | head -n 1)"
    selected_container="$(echo "$output" | tail -n +2 | fzf --header="$header" | awk '{print $1}')"
    if [[ -n "${selected_container}" ]]; then
        if [[ "$(docker inspect -f '{{.State.Status}}' "$selected_container")" == "running" ]]; then
            echo "${selected_container} is running."
            echo "Do you want to stop it?"
            select yn in "Yes" "No"; do
                local rep=${yn:-$REPLY}
                case $rep in
                Yes | yes | y)
                    echo "$(docker stop "${selected_container}") stopped"
                    break
                    ;;
                No) exit ;;
                esac
            done

        else
            echo "$(docker start "${selected_container}") started"
        fi
    fi
}
