# Use Ruby 2.7.1 from Docker Hub
FROM ruby:2.7.1

ENV BUNDLER_VERSION=2.1.4
RUN gem install bundler -v 2.1.4

# Use a dir called /code to store app files
WORKDIR /app

COPY Gemfile Gemfile.lock ./
# Add Gemfile stuff. This way bundle is only run when either Gemfile/Gf.lock is changed
# Run bundle install
RUN bundle check || bundle install

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Run yarn to install JS dependencies
COPY package.json yarn.lock ./
RUN yarn install --check-files

# Copoy all app files into code
COPY . /app

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

