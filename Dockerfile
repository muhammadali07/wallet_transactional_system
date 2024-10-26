# Gunakan image dasar Ruby
FROM ruby:2.7

# Install dependensi sistem
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Tentukan direktori kerja di dalam kontainer
WORKDIR /wallet

# Salin file Gemfile dan Gemfile.lock ke kontainer
COPY /wallet/Gemfile /wallet/Gemfile.lock ./

# Install bundler dan semua gem
RUN gem install bundler -v 2.2.32 && bundle install

# Salin semua kode aplikasi ke dalam kontainer
COPY . .

# Ekspos port untuk aplikasi
EXPOSE 3000

# Tentukan perintah untuk memulai server Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
