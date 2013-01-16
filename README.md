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
3. What is the DOM?
4. Installing tools (Ruby and Nokogiri)
5. How I (and you) can use jQuery and Nokogiri for scraping


## What is an HTTP request?
Short answer: a bunch of text

Long answer: TODO put links here

Paste this in your terminal: `curl https://news.ycombinator.com/`  
TODO add explanation of what curl is doing -- tldr: it does a web request to `https://news.ycombinator.com/` and spits out the results of the request

## Using regex for parsing
If this doesn't get done in time… sorry, you'll have to ask.  
TODO add an example of using ruby to parse response with regex.

## What is the DOM?
TODO put links about what the dom is.  
Visit [Hacker News](https://news.ycombinator.com/). See how nice and pretty it is? That's a combination of stylesheets and HTML. HTML is really just text, but the browser can interpret it's nice tree structure. (TODO put a link here) to learn more about it. We can use this to our advantage.  

TODO put screenshot of chrome inspector, show DOM in workshop

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