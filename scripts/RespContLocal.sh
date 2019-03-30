# Define report export path
REPORT_PATH="../reports/response-content"

# Make a directory in which to store HTML reports, creating parent dirs as needed
mkdir -p $REPORT_PATH

# Using newman...
# Run ResponseContent collection:     run ../collections/ResponseContent.postman_collection.json
#  in Local env:            -e ../env/Local.postman_environment.json
#  load booking data file:  -d ../data/booking.json
#  output via newman-reporter-htmlextra:    -r htmlextra
#  export report to dir created above:      --reporter-htmlextra-export $REPORT_PATH
#  with 'Response Content Test' title on HTML report page:     --reporter-htmlextra-title "Response Content Test"
newman run ../collections/ResponseContent.postman_collection.json -e ../env/Local.postman_environment.json -d ../data/booking.json -r htmlextra --reporter-htmlextra-export $REPORT_PATH --reporter-htmlextra-title "Response Content Test"
