#!/bin/bash -e
PATH=$PATH:/root/.yarn/bin/
echo "USING PATH: $PATH"
exec "$@"
