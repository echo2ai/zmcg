#!/bin/bash

# Backwards-compatibility wrapper for previous script name
# This wrapper exists to help users who still run the old filename.
# It will print a message and try to invoke the new 'zmcg' binary if present.

if [ -x "./zmcg" ]; then
    echo "Running local ./zmcg (new name)..."
    exec "./zmcg" "$@"
fi

if command -v zmcg >/dev/null 2>&1; then
    echo "Invoking installed 'zmcg'..."
    exec zmcg "$@"
fi

echo "\nThis repository has renamed the main script to 'zmcg'."
echo "Please run './zmcg' or install it via './install.sh' and then run 'zmcg'."
exit 1