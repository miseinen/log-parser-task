## Log Parser

### Task Description:<br/>
Write a ruby script that:<br/>
- [x] Receives a log as an argument (webserver.log is provided): e.g.: `./runner.rb webserver.log`
- [x] Returns formatted logs as the following:<br/>
<pre>
  > list of webpages with most page views ordered from most pages views to less page views
      /home 90 visits
      /index 80 visits etc…
   > list of webpages with most unique page views also ordered
      /about/2 8 unique views
      /index 5 unique views etc…`
</pre>
- Cover by unit tests

### Installation: <br/>
- Clone this repo
- Install Ruby v3.0.2. Click the link for instructions: [Ruby Installation](https://www.ruby-lang.org/en/documentation/installation/)
- Open a terminal and navigate to the folder containing the cloned repo
- Run ```bundle install```
- Run ```./runner.rb webserver.log```🎉 (or ```./runner.rb webserver.log jp``` if you want to enjoy application in Japanese version)

### Testing:
- unit tests with the help of [**Rspec**](https://github.com/rspec):  ```bundle exec rspec -fd```
- code style tests with the help of [**Rubocop**](https://github.com/rubocop/rubocop):  ```bundle exec rubocop```
