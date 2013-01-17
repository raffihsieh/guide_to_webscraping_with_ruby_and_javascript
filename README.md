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
HTML has a nice tree structure. If you're not familiar with HTML, start here: [MDN HTML](https://developer.mozilla.org/en-US/docs/HTML/Introduction)  
The main thing to note is that we can use CSS selectors to help us find the information we want.  
If you're not familiar with CSS selectors see here: [MDN CSS Selectors](https://developer.mozilla.org/en-US/docs/CSS/Getting_Started/Selectors) and [30 CSS Selectors You Must Memorize](http://net.tutsplus.com/tutorials/html-css-techniques/the-30-css-selectors-you-must-memorize/)

This is HTML as viewed in the chrome inspector. (TODO put link to image)

## Installing tools
Install these:

* [Ruby](http://www.ruby-lang.org/en/downloads/)
* [Nokogiri](http://nokogiri.org/tutorials/installing_nokogiri.html)
* [jQuerify](http://www.learningjquery.com/2009/04/better-stronger-safer-jquerify-bookmarklet/)
* [pry](http://pryrepl.org/) 

Watch out for Nokogiri, make sure you install the requirements listed on the installation page (it silently fails if you don't).

## How to scrape with Nokogiri and jQuery
1. Look at DOM
2. Play around with jQuery to find out what selectors you want to use
3. Try it out in ruby via irb / pry
4. Write your script
5. Scrape!

Let's do this for Hacker News. Our goal is to parse out all the titles.  
First we look at the DOM using the chrome web inspector. If you haven't used the web inspector before, skim here: [For an overview](https://developers.google.com/chrome-developer-tools/docs/overview) and [here for elements](https://developers.google.com/chrome-developer-tools/docs/elements)

1. In the following screenshot, we can see that it looks like the titles are in a td element with class "title"  
	TODO put image here.

2. Based upon what we saw in the web inspector, we can now play around with jquery to find out the css selector we want. By clicking the jquerify bookmarklet jquery will be loaded. (note: the bookmarklet won't work if you're on https://news.ycombinator.com -- you need to be at http://news.ycombinator.com)  
jQuery allows you to easily test out css selectors and see what they return. The syntax for this is `$(<CSS Selector>)` and can be done in the javascript console, like in the screen shot below.  
The blue text is what I entered and below it is the result of the query. By playing around with selectors you can eventually find a concise way to get the elements you want.
	TODO put image here

3. Now that we have an idea of the css selector we want to use, something like `.title a` we can turn to Ruby to write a script to do parsing. I like to play around with it in the console first. If you installed pry open a terminal and run `pry`, otherwise open a terminal and run `irb`.

Then, type the following:
TODO put github code style for ruby highlighting.
```
require 'rubygems'
require 'nokogiri' # you installed this, right?
require 'open-uri'

doc = Nokogiri::HTML(open("http://news.ycombinator.com/"))
elems = doc.css('.title a')
titles = elems.map { |e| e.text }
```

oo wow!

So what's going on?

1. `open` does a web request for us and returns the html text.
2. `Nokogiri::HTML` creates a Nokogiri document which we can then use css selectors with.
3. `rows = doc.css('.title a')` selects all the "a" elements that are nested inside anything with the "title" class
4. Finally, `titles = elems.map { |e| e.text }` iterates over every "a" element and extracts the text from it

That's all there really is to scraping. For a more complicated example (where urls are extracted, and used for further scraping jobs) check out [this](https://github.com/ibash/uiuc_class_api/blob/master/lib/scraper.rb).

Finally, what if you want to scrape hacker news every 5 minutes? Take a look at the [whenever gem](https://github.com/javan/whenever) -- be aware though that if you access some sites too often they may rate limit you.



