#!/usr/bin/env bash
set -e
# Compile and run the simple Java app.
# Make executable: chmod +x /workspaces/java-app/run.sh
mkdir -p out
javac -d out src/Main.java
java -cp out Main "$@"
