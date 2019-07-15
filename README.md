# smartpension test

Objective: to write a program that receives a logfile and returns the following

> list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc...

> list of webpages with most unique page views also ordered e.g.:
/about/2 8 unique views /index 5 unique views etc...

## Installation

```bash
bundle install
```

## Usage

```bash
ruby bin/run.rb
```

## Side Notes

db/control.rb is an attempt at writing two methods. The first reads from the console and writes to the file cache.log. The second method reads the cache.log file line by line and checks to see if each line contains a relevant route. If it does, then it's supposed to add that line to the webserver.log file. Both methods work, however I haven't yet figured out how to chain them together so as they work in tandem. 

Will be continuing my debugging for that specifically. 

## Thank you

For taking your time reviewing this code. 