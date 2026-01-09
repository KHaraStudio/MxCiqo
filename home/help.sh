#!/bin/bash
# DESC: Show help (--help)

APP="MxCiqo"
BASE="$HOME/.MxCiqo"
HOME_DIR="$BASE/home"
PLUGINS="$BASE/plugins"

GREEN='\033[1;32m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
DIM='\033[2m'
NC='\033[0m'

clear
echo -e "${GREEN}${APP}${NC} - Command Reference"
echo -e "${DIM}Usage:${NC}"
echo -e "  ${CYAN}${APP}${NC} [options] <command>"
echo

echo -e "${DIM}Options:${NC}"
echo -e "  ${GREEN}--help${NC}        Show this help"
echo -e "  ${GREEN}--version${NC}     Show version info"
echo

echo -e "${DIM}Main Commands:${NC}"
for f in "$HOME_DIR"/*.sh; do
  name=$(basename "$f" .sh)
  desc=$(sed -n 's/^# DESC:[[:space:]]*//p' "$f")
  printf "  ${GREEN}%-14s${NC} ${WHITE}%s${NC}\n" "$name" "${desc:-No description}"
done

echo
echo -e "${DIM}Plugin Commands:${NC}"
for f in "$PLUGINS"/*.sh; do
  name=$(basename "$f" .sh)
  desc=$(sed -n 's/^# DESC:[[:space:]]*//p' "$f")
  printf "  ${GREEN}%-14s${NC} ${WHITE}%s${NC}\n" "$name" "${desc:-No description}"
done

echo