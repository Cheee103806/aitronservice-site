#!/bin/sh
# www.aitronservice.com routes "/" to the hosting folder /site, not the hosting root (that is the web app).
set -e
cd "$(dirname "$0")"
git pull --ff-only
tmp=$(mktemp -d)
cp index.html logo.png gongan.png "$tmp/"
cp -R legal "$tmp/"
npx --yes -p @cloudbase/cli tcb hosting deploy "$tmp" site -e cheee-1-d7gy44h8zd718a657
rm -rf "$tmp"
