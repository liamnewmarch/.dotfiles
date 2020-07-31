alias db='docker build --rm'
alias dcb='docker-compose build'
alias dcd='docker-compose down'
alias dce='docker-compose exec'
alias dcr='docker-compose run --rm'
alias dcrs='docker-compose restart'
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias dcud='docker-compose up --detach'
alias dcl='docker-compose logs --follow --tail 0'
alias dcla='docker-compose logs --follow'
alias dcps='docker-compose ps'
alias de='docker exec'
alias dei='docker exec -it'
alias dr='docker run --rm'
alias dri='docker run --rm -it'

dls() {
  printf "\n$(blue 'Docker containers')\n"
  docker container ls
  printf "\n$(blue 'Docker images')\n"
  docker image ls
  printf "\n$(blue 'Docker volumes')\n"
  docker volume ls
  printf "\n$(blue 'Docker networks')\n"
  docker network ls
}

drm() {
  printf "\n$(red 'Pruning Docker containers')\n"
  docker container prune -f
  printf "\n$(red 'Pruning Docker images')\n"
  docker image prune -f
  printf "\n$(red 'Pruning Docker volumes')\n"
  docker volume prune -f
  printf "\n$(red 'Pruning Docker networks')\n"
  docker network prune -f
}
