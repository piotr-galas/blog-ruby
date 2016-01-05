Blog application
=========


## Instalation

To install projet please follow standart rails way:


* 1) clone
* 2) install dependencies: `bundle install`
* 3) run migration `rake db:migration`
* 4) run seed   `rake db:seed`
* 5) run server `rails s`

## What is inside

Application is the simple blog inspired on [tutorials.jumpstartlab.com/projects/blogger.html](tutorials.jumpstartlab.com/projects/blogger.html). It is created as sample app to apply new job. There are a few new features which are not included in
tutorial


## Features:

#### Features coverd by tutorial:

* Article, Comment, Tag  - crud and relation
* Simple authorization without relation


#### New added featurers:

* Personalization of comment and article
* Filtering articles based on [ filtering article](http://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/) and [send_public article](http://vaidehijoshi.github.io/blog/2015/05/05/metaprogramming-dynamic-methods-using-public-send/) and some own improvemnt
* Create test for article controller
