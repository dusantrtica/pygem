import datetime

def convert_date(d):
	if type(d) in [datetime.datetime, datetime.date]:
		return d.isoformat()

	return d