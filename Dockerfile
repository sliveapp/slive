# base image elixer to start with
FROM elixir:1.5.1


# install hex package manager
RUN mix local.hex --force

# install phoenix
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# install node
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs

# create app folder
RUN mkdir /app
COPY . /app
WORKDIR /app

ENV MIX_ENV=prod
ENV PORT=4000

# install dependencies
RUN mix local.rebar --force
RUN mix deps.get --only prod
RUN mix compile

# install node dependencies
RUN npm install
RUN node node_modules/brunch/bin/brunch build --production

# run phoenix
RUN mix phoenix.digest
CMD mix phoenix.server

