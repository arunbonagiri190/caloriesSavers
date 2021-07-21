#!/usr/bin/bash

# defining variable with default project location
WPATH="/home/$USER/workspace/"

# changing dir, where we create
cd "$WPATH"

# creating project folder
mkdir "$1"

# getting into project folder
cd "$1"

# creating additional folders
# for documents
mkdir "docs"

# for source code
mkdir "src"

# for data
mkdir "data"

# creating common files
touch "README.md"

touch "LICENCE.md"

# intializing git
git init

# launching vscode and exiting
code . &
exit
