[![Build Status](https://travis-ci.org/sliveapp/ItSlive.svg?branch=master)](https://travis-ci.org/sliveapp/ItSlive)
# Slive

## Installation

We are using [Docker](https://docs.docker.com/get-started/) to avoid dependency/installation errors on different systems. Using **Docker** allows every system to run the project smoothly (even **WINDOWS**!) - we are basically running a virtual system with everything needed to avoid errors on differents computers.

--

These are the steps to get this working:

0. Clone the project, and go inside its folder.
1. Donwload docker at https://docs.docker.com/engine/installation/ - Linux distros are on the "Server" section.
2. After downloading and starting Docker, run `docker-compose build` to build the image for the project (it will take a while)
3. After running the build command, run `docker-composer -d postgres` to initialize the database
4. Now we only need to make sure we migrate the data with:

   4.1 `docker-compose run phoenix mix ecto.create`
   
   4.2 `docker-compose run phoenix mix ecto.migrate` (this step is needed every time you create a migration)

5. You can now start the server with `docker-compose up phoenix`, it will run at `:4000` port on your machine (`http://localhost:4000`). Edit your code as normal.

6. To compile assets (and watch them), I recommend running `docker-composer run phoenix bash` and `cd assets` to run Brunch.io commands (like `npm run-script watch` and so on)



## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
