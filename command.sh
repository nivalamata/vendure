#prerequisite 
#node  > v22.12.0
#bun 
# install via curl -fsSL https://bun.sh/install | bash
#install top level dependences 
bun install 

# Build all packages 
bun run build

#Start docker containers 
#set postgre in .env path /packages/dev-server
 DB=postgres
docker compose up -d postgres_16
#for elasticsearch 
#docker compose up -d elasticsearch


#populate test data
cd packages/dev-server
bun run populate

#Run the devserver
cd packages/dev-server
bun run dev

#default admin UI credentials superadmin:superadmin

#testing admin UI changes locally (You don't need this step when you just use the Admin UI just to test backend changes since the dev-server package ships with a default admin-ui)
cd packages/admin-ui
bun run dev

#Watch changes to the package 
cd packages/email-plugin
bun run watch

#If you are developing changes for the core package, you also need to watch the common package
bun run watch:core-common

#NB:After making changes, you need to stop and restart the development server to see your changes
Development Workflow Summary
Start your package watcher (bun run watch)
Start the dev-server (bun run dev)
Make code changes
Wait for compilation to complete
Restart dev-server to see changes


#Developing and making changes
#create a new branch
git checkout -b your-new-branch
