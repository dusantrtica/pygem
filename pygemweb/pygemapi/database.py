import pyodbc

"""
This module contains database stuff
In the future, involve connection pool
"""
class DatabaseConnector(object):
	_connection = None
	def __init__(self, config):

		self._database_uri = config.get('DATABASE_URI')		
		#self._connection = pyodbc.connect(self._database_uri)

	def connect(self):
		try:
			self._connection = pyodbc.connect(self._database_uri)
		except Exception as e:
			pass
		

	def disconnect(self):
		try:
			self._connection.close()
		except Exception as e:
			pass

	def get_connection(self):
		if not self._connection:
			self.connect()

		return self._connection
