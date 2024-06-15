#!/usr/bin/env sh

# Description of the build process
echo 'The following "npm" command builds your Node.js/React application for'
echo 'production in the local "build" directory (i.e. within the'
echo '"/var/jenkins_home/workspace/simple-node-js-react-app" directory),'
echo 'correctly bundles React in production mode and optimizes the build for'
echo 'the best performance.'

# Enable debugging
set -x

# Clean install dependencies
rm -rf node_modules
npm install

# Run the build command
npm run build || { echo 'Build failed'; exit 1; }

# Disable debugging
set +x

# Description of the start process
echo 'The following "npm" command runs your Node.js/React application in'
echo 'development mode and makes the application available for web browsing.'
echo 'The "npm start" command has a trailing ampersand so that the command runs'
echo 'as a background process (i.e. asynchronously). Otherwise, this command'
echo 'can pause running builds of CI/CD applications indefinitely. "npm start"'
echo 'is followed by another command that retrieves the process ID (PID) value'
echo 'of the previously run process (i.e. "npm start") and writes this value to'
echo 'the file ".pidfile".'

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

# Description of the application status
echo 'Now...'
echo 'Visit http://localhost:3000 to see your Node.js/React application in action.'
echo '(This is why you specified the "args ''-p 3000:3000''" parameter when you'
echo 'created your initial Pipeline as a Jenkinsfile.)'
