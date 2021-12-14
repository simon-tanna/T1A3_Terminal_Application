echo $1
#remove Gemfile.lock
rm Gemfile.lock
#install bundle
gem install bundle
#install the gems
bundle install
#run program
ruby index.rb $1