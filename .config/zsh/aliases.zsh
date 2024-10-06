alias bat="batcat"

cfl() {
  echo -e "\nIdentity provider:\tatcgadkea-platform\n"
  echo atcgadkea-platform | xclip -selection clipboard
  cf l -a https://api.cf.eu20.hana.ondemand.com -o eam-eo-pred -s gc-cockpit --sso
}

flog() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/eon_gitlab
  ssh-add ~/.ssh/pers_github
}
