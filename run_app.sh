echo $1
echo $2
#remove Gemfile.lock
rm Gemfile.lock
#install bundle
gem install bundle
#install the gems
bundle install
#run program
ruby index.rb $1 $2