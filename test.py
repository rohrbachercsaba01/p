import sqlite3
from datetime import datetime, timedelta

# Adott dátumok listája
start_date = "2024-04-18"
end_date = "2024-04-22"

# Convert string dates to datetime objects
start_date = datetime.strptime(start_date, "%Y-%m-%d")
end_date = datetime.strptime(end_date, "%Y-%m-%d")

# Create a list of dates between start_date and end_date inclusive
list = [start_date + timedelta(days=x) for x in range((end_date - start_date).days + 1)]

# Function to check if a date is weekend
def is_weekend(date_str):
        #date = datetime.strptime(str(date_str), '%Y-%m-%d')
        if date_str.weekday() in [5, 6]:  # Saturday is 5, Sunday is 6
            return True
        else:
            return False

def cutOffWeekends(date_list): 
    weekday_ranges = []
    current_start_date = None

    for date in date_list:
        if is_weekend(date) is False:
            if current_start_date is None:
                current_start_date = date
            current_end_date = date
        else:
            if current_start_date is not None:
                weekday_ranges.append((current_start_date, current_end_date))
                current_start_date = None

    if current_start_date is not None:
        weekday_ranges.append((current_start_date, current_end_date))


    
    return weekday_ranges

print(cutOffWeekends(list))