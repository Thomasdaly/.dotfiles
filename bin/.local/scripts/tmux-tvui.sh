#!/usr/bin/env bash
tmux-windowizer client ␃␃␃␃␄
tmux-windowizer server ␃␃␃␃␄

branch_name=$(basename $1)
tmux-windowizer client cd $branch_name
tmux-windowizer client ./tvui client

tmux-windowizer server cd $branch_name
tmux-windowizer server ./tvui server
