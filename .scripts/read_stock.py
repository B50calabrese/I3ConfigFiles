import json;
import requests;
import sys;

# Used for debugging the script, extra logging is printed.
debug = False;

# Symbols we would like to keep track of.
SYMBOLS = ['GOOG', 'AMZN'];

# Values in the response we actually care about and the "pretty" name of the
# value.
KEYS = {'regularMarketPrice': 'Price'};

# Base URL to retrieve stocks from.
BASE_URL = 'https://query1.finance.yahoo.com/v7/finance/quote?lang=en-US&region=US&corsDomain=finance.yahoo.com&symbols=';

# The json object of the response from Yahoo.
request_url = BASE_URL + ",".join(SYMBOLS);
response = requests.get(request_url);
json_obj = response.json()['quoteResponse']['result'];

if debug:
  print json.dumps(json_obj, sort_keys=True, indent=4, separators=(',', ': '));

result_string = '';
# For each symbol append relevant information.
for index, symbol in enumerate(SYMBOLS):
  result_string = result_string + symbol + ' ';
  # For each of the keys we actually care about let's print them.
  for key in KEYS.keys():
    result_string = result_string + KEYS[key] + ': ' + str(json_obj[index][key]) + ' ';


print result_string
