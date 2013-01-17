#!/usr/bin/env ruby
text = ARGF.read
titles = text.scan(/<td class="title"><a href=.*?>(.*?)<\/a>/)
puts titles.inspect
