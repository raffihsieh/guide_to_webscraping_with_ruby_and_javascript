# Scraping with Nokogiri and jQuery

## Notes

* This guide is meant to be accomponied by a workshop -- I'll try my best to make
it stand alone, but if anything is confusing, ask.
* Feel free to fork/change/pull request.
* This assumes you have familiarity with ruby and javascript.
* Since I have OSX installation for Nokogiri will be for osx, feel free to fork/pull request additonal instructions if you're running any other OS.

## Overview
Topics will be:

1. What is an HTTP request? (what are we sending, and what we are recieving)
2. Using regex for parsing
3. What is HTML?
4. Installing tools (Ruby and Nokogiri)
5. How I (and you) can use jQuery and Nokogiri for scraping


## What is an HTTP request?
The short answer: A request to a webserver that returns a bunch of text  
The long answer: [MDN HTTP](https://developer.mozilla.org/en-US/docs/HTTP)

For our purposes all you need to know is that an HTTP request (which happens when you visit a website) gives you back the HTML of the page as text. This means that whatever you can use to match or parse out of text, you can use to do web scraping.  

Curl is a tool to do http requests, paste this in your terminal: `curl http://news.ycombinator.com/`  
You should get something [like this](http://raw.github.com/ibash/guide_to_webscraping_with_ruby_and_javascript/master/curl_output.txt) in your terminal. That's the HTML of the page and we can use regex to parse it.

## Using regex for parsing
What is regex?  
The short answer: A way to match in a piece of text  
The long answer: TODO find a link for this

Now, assuming you have ruby installed (installation links are in a later section, feel free to install ruby and come back). Create a script called `regex_example.rb` with the following contents:  

```
#!/usr/bin/env ruby
text = ARGF.read
titles = text.scan(/<td class="title"><a href=.*?>(.*?)<\/a>/)
puts titles.inspect
```  

Then run `curl http://news.ycombinator.com/ | ruby regex_example.rb`

Holy moly Batman! What just happened?  
(if you weren't able to run it, the output was something like [this](https://raw.github.com/ibash/guide_to_webscraping_with_ruby_and_javascript/master/regex_example_output.txt))  

The regex inside text.scan looked through the output of curl and picked out the titles. Read more about regex (and TODO for me it to add useful links!), their useful but we need to move on.


## What is HTML?
TODO put links about what HTML is.  
TODO put a screenshot of chrome inspector and explain how it has a tree structure (that we can use to our advantage).  
Visit [Hacker News](https://news.ycombinator.com/). See how nice and pretty it is? That's a combination of stylesheets and HTML. HTML is really just text, but the browser can interpret it's nice tree structure. (TODO put a link here) to learn more about it. We can use this to our advantage.  

TODO put links about css selectors

## Installing tools
* [Ruby](http://www.ruby-lang.org/en/downloads/)
* [Nokogiri](http://nokogiri.org/tutorials/installing_nokogiri.html)
* [jQuerify](http://www.learningjquery.com/2009/04/better-stronger-safer-jquerify-bookmarklet/)
* [pry](http://pryrepl.org/) optional

Watch out for Nokogiri, make sure you install the requirements listed on the installation page (it silently fails if you don't).

## How to scrape with Nokogiri and jQuery
1. Look at DOM
2. Play around with jQuery to find out what selectors you want to use
3. Try it out in ruby via irb / pry
4. Write your script
5. Scrape!
6. TODO possibly add links about making it recurrent with cron