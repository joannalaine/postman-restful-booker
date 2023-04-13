# Define report export path
REPORT_PATH="./reports/request-response-formats"

# Make a directory in which to store HTML reports, creating parent dirs as needed
mkdir -p $REPORT_PATH

# Using newman...
# Run RequestResponseFormats collection:     run ./collections/RequestResponseFormats.postman_collection.json
#  in Local env:            -e ./env/Local.postman_environment.json
#  output via newman-reporter-htmlextra:    -r htmlextra
#  export report to dir created above:      --reporter-htmlextra-export $REPORT_PATH
#  with 'Request/Response Formats Test' title on HTML report page:     --reporter-htmlextra-title "Request/Response Formats Test"
newman run ./collections/RequestResponseFormats.postman_collection.json -e ./env/Local.postman_environment.json -r htmlextra --reporter-htmlextra-export $REPORT_PATH --reporter-htmlextra-title "Request/Response Formats Test"
