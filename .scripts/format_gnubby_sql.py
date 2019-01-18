import csv

# Used to format a CSV file into an expected format for Emily.

fileName = 'in2'

# Indicies of various data
EMAIL = 0
USERID = 1
SK_NAME = 2
ENROLLMENT_DATE = 4
LAST_USE_DATE = 6
LAST_USE_PLATFORM = 7

users = {}

with open(fileName, 'r') as csvfile:
  reader = csv.reader(csvfile)

  for row in reader:
    user = row[0]

    # If it's the first time we see this user, store the e-mail and user id.
    if not users.has_key(user):
      users[user] = user + ", " + row[USERID]

    users[user] += ", " + row[SK_NAME] + ", " + row[ENROLLMENT_DATE] + ", "\
        + row[LAST_USE_DATE] + ", " + row[LAST_USE_PLATFORM]

f = open('out2.csv', 'w');
for user in users:
  f.write(users[user] + "\n")

f.close()
