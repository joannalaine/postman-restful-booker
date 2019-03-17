# Postman demo with restful-booker

## Background

I took a great, free online course by Amber Race [(@ambertests)](https://twitter.com/ambertests) through [Test Automation University](https://testautomationu.applitools.com/) by Applitools: 

[Exploring Service APIs through Test Automation](https://testautomationu.applitools.com/exploring-service-apis-through-test-automation/)

In it, she introduces API testing basics, [Postman](https://www.getpostman.com/), the [Restful Booker API](https://restful-booker.herokuapp.com/) and [Newman](https://github.com/postmanlabs/newman). Her course inspired me to explore all these things and learn more about API testing.

I set up this repo as a place to store my study work and document for myself what I've learned so far. If you're also new to API testing and find something in here that helps you get started, right on!

Note: I've done all of my work on a Mac, so you will see Mac-specific references here and there.

## Setup

- Install [Postman](https://www.getpostman.com/)
- Install [Restful Booker API](https://github.com/mwinteringham/restful-booker) locally
- Install [Newman](https://github.com/postmanlabs/newman)
- Install [newman-reporter-htmlextra](https://github.com/DannyDainton/newman-reporter-htmlextra)

## Repo Structure
- collections: 
  - Requests in Postman can be grouped into collections. I've used collections to organize requests into test suites.
- env: 
  - Postman uses the concept of environments to manage variables between various server setups (local, dev, production, etc.). I've created two environment configurations: local and production.
- scripts: 
  - Postman collections can be executed via the command line using Newman. To save myself the work of entering the same command and parameters into my terminal, I've created a shell script to do it for me.