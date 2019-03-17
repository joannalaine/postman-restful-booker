# Define report export path
REPORT_PATH="../reports/smoke"

# Make a directory in which to store HTML reports, creating parent dirs as needed
mkdir -p $REPORT_PATH

# Using newman...
# Run Smoke collection:     run ../collections/Smoke.postman_collection.json
#  in Local env:            -e ../env/Local.postman_environment.json
#  output via newman-reporter-htmlextra:    -r htmlextra
#  export report to dir created above:      --reporter-htmlextra-export $REPORT_PATH
#  with 'Smoke Test' title on HTML report page:     --reporter-htmlextra-title "Smoke Test"
newman run ../collections/Smoke.postman_collection.json -e ../env/Local.postman_environment.json -r htmlextra --reporter-htmlextra-export $REPORT_PATH --reporter-htmlextra-title "Smoke Test"