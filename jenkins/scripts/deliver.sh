# Enable debugging
set -x

# Clean install dependencies
rm -rf node_modules
npm install

# Run the build command
npm run build || { echo 'Build failed'; exit 1; }

# Disable debugging
set +x

# Enable debugging
set -x

# Run the start command in the background
npm start &

# Wait for a second to ensure the process starts
sleep 1

# Save the PID of the npm start process to .pidfile
echo $! > .pidfile

# Disable debugging
set +x
