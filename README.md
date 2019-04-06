# Postman demo with restful-booker

## Background

I took a great, free online course by Amber Race [(@ambertests)](https://twitter.com/ambertests) through [Test Automation University](https://testautomationu.applitools.com/) by Applitools: 

[Exploring Service APIs through Test Automation](https://testautomationu.applitools.com/exploring-service-apis-through-test-automation/)

In it, she introduces API testing basics, [Postman](https://www.getpostman.com/), the [Restful Booker API](https://restful-booker.herokuapp.com/) and [Newman](https://github.com/postmanlabs/newman). Her course inspired me to explore each of these and learn more about API testing.

I set up this repo as a place to store my study work and document for myself what I've learned so far. If you're also new to API testing and find something in here that helps you get started, right on!

Note: I've done all of my work on a Mac, so you will see Mac-specific references here and there.

## Repo Structure
- collections: 
  - Requests in Postman can be grouped into collections. I've used collections to organize requests into test suites.
- env: 
  - Postman uses the concept of environments to manage variables between various server setups (local, dev, production, etc.). I've created two environment configurations: local and production.
- scripts: 
  - Postman collections can be executed via the command line using Newman. To save myself the work of entering the same command and options into my terminal, I've created shell scripts to do it for me, based on collection and environment.

## Dependencies

- Install [Postman](https://www.getpostman.com/)
- Install [Restful Booker API](https://github.com/mwinteringham/restful-booker) locally (optional)
  - This API is deployed publicly and testing against the live version is welcomed. 
  - However, I recommend installing and running the API from your machine for a few reasons:
    - You'll get to see the activity logging
    - You won't have to worry about the API being inaccessible due to maintenance or network issues
    - You'll be guaranteed to be the only person touching your data
- Install [Newman](https://github.com/postmanlabs/newman)
- Install [newman-reporter-htmlextra](https://github.com/DannyDainton/newman-reporter-htmlextra)

## Setup

1) Install all dependencies listed above.
2) Download or clone this repo.
3) Launch Postman
   1) Create a new personal workspace, if desired.
      - More info: [Intro to Workspaces](https://learning.getpostman.com/docs/postman/workspaces/intro_to_workspaces)
   2) Import a collection (from file) into Postman.
      - More info: [Collection - Data Formats](https://learning.getpostman.com/docs/postman/collections/data_formats/#importing-postman-data)
      - Collection files are stored in this repo under /collections (ex. collections/Smoke.postman_collection.json)
   3) Import one or more environments (from file(s)) into Postman.
      - Environments are imported the same way that collections are.
      - Environment files are stored in this repo under /env (ex. env/Production.postman_environment.json)
      - Import the Production environment file if you'd like to run tests against the publicly-accessible instance of [Restful Booker](https://restful-booker.herokuapp.com).
      - Import the Local environment file if you'd like to run tests against an instance of Restful Booker running locally on your machine.
4) Start your local instance of Restful Booker (optional).
   - More info: [Restful Booker](https://github.com/mwinteringham/restful-booker)
5) Select your desired environment in Postman.
   - More info: [Selecting an active environment](https://learning.getpostman.com/docs/postman/environments_and_globals/manage_environments/#selecting-an-active-environment)
   - Select "Production" if you want to test against the publicly-accessible instance, or select "Local" if you are running Restful Booker locally.


## Running Tests

When running tests, you can choose to run them in various ways:

### Run a test for a single request

1) On the Collections tab of the Postman sidebar, expand the imported Smoke collection and expand any of the included folders, such as "Auth".
2) Select a request, such as "CreateToken" under the Auth folder.
3) Within the CreateToken screen, you'll see smaller tabs for the request info (Params, Authorization, Headers, etc.)
   - Click on the Body tab to see what the request will send.
   - Click on the Tests tab to see what will be validated after the request is sent.
4) Click the big, blue "Send" button in the upper-right of the CreateToken screen.
5) All of the response info will then be updated in the lower portion of the screen.
6) Tap on the "Test Results" tab to see if the test(s) passed or failed. 

### Run all tests for a folder or collection

1) From the Postman header bar, click "Runner".
2) From the collection browser, select either a collection, such as "Smoke", or drill down to a specific folder, such as "Booking".
3) Select your desired environment from the dropdown.
4) Click the big, blue "Run" button.
5) Review the list of Run Results to see which tests passed or failed.
- More info: [Starting a collection run](https://learning.getpostman.com/docs/postman/collection_runs/starting_a_collection_run/)

### Run a collection using Newman

1) In a Terminal, change directory to the top level of this repo.
2) Run the following command (alter the paths for the collection file and environment file, if needed):
```console
newman run collections/Smoke.postman_collection.json -e env/Local.postman_environment.json -r htmlextra
```
   - More info: [Command line integration with Newman](https://learning.getpostman.com/docs/postman/collection_runs/command_line_integration_with_newman/)
3) This will create a newman folder in your repo directory.
   - Using Finder, navigate to the newman folder and open the html file that was just created to view the test report.
    - More info: [newman-reporter-htmlextra](https://github.com/DannyDainton/newman-reporter-htmlextra)
4) Note: I've created a shell script to run the Smoke collection against the local environment, and export a report to reports/smoke.
   - Script is located in: scripts/SmokeLocal.sh
   - Review the script to see the specific options that I've used.

## Running Data-Driven Tests

In the Response Content collection, I use data stored in a JSON file to populate the pre-request script values. In order to import the data contained in an external file, it must be specified at collection runtime.

### Run a collection with a data file

1) From the Postman header bar, click "Runner".
2) From the collection browser, select either a collection, such as "Response Content", or drill down to a specific folder, such as "Booking".
3) Select your desired environment from the dropdown.
4) Click the "Select File" button next to "Data" and choose the data/booking.json file.
5) Click the "Preview" button next to "Data File Type" to see the data records that were imported.
6) Click the big, blue "Run" button.
7) Review the list of Run Results to see which tests passed or failed.
- More info: [Working with data files](https://learning.getpostman.com/docs/postman/collection_runs/working_with_data_files)

### Run a collection with a data file using Newman

1) In a Terminal, change directory to the top level of this repo.
2) Run the following command (alter the paths for the collection file and environment file, if needed):
```console
newman run collections/ResponseContent.postman_collection.json -e env/Local.postman_environment.json -d data/booking.json -r htmlextra
```
   - More info: [Command line integration with Newman](https://learning.getpostman.com/docs/postman/collection_runs/command_line_integration_with_newman/)
3) This will create a newman folder in your repo directory.
   - Using Finder, navigate to the newman folder and open the html file that was just created to view the test report.
    - More info: [newman-reporter-htmlextra](https://github.com/DannyDainton/newman-reporter-htmlextra)
4) Note: I've created a shell script to run the Response Content collection against the local environment with the booking data file, and export a report to reports/response-content.
   - Script is located in: scripts/RespContLocal.sh
   - Review the script to see the specific options that I've used.
