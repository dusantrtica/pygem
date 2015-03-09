from __future__ import unicode_literals
from datetime import datetime

class Serializer(object):
	def __init__(self, cursor, **kwargs):
		self.many = kwargs.get('many', False)
		self.cursor = cursor
		self.fields = kwargs.get('fields', None)

	@property
	def data(self):
		# If we set fields then those are used for projection. Otherwise entire query is used
		if self.fields:
			columns = [column[0] for column in self.cursor.description if column[0].lower() in self.fields]
		else:
			columns = [column[0] for column in self.cursor.description]
		results = []
		for row in self.cursor.fetchall():
			results.append(dict(zip(map(lambda x:x.lower(), columns), map(lambda x:row.__getattribute__(x), columns))))

		if not self.many:
			return results[0]
		else:
			return results

class MethodField(object):
	def __init__(self, function_name):
		self._function_name = function_name



# Class that takes pyodbc result set and returns python dict
class EmployeeListSerializer(Serializer):
	def __init__(self, cursor, **kwargs):
		kwargs['fields'] = self.fields		
		super(EmployeeListSerializer, self).__init__(cursor, **kwargs)

	employeejob = MethodField('get_employeejobtitle')
	employeejobtype = MethodField('get_employeejobtypetitle')

	fields = [
	    'employeeid',
		'employeefirstname',
		'employeesurname',		
		'employeejobtypes'
	]

	def get_employeejobtitle(self, param):
		return 'Nastavno Osoblje'

	def get_employeejobtypetitle(self, param):
		return 'Redovni Profesor'

class EmployeeSerializer(Serializer):
	def __init__(self, cursor, **kwargs):
		kwargs['fields'] = self.fields
		super(EmployeeSerializer, self).__init__(cursor, **kwargs)

	# We ommit fields because we want all of the data from query
	fields = [
	]

class EmployeePositionsSerializer(Serializer):
	def __init__(self, cursor, **kwargs):
		kwargs['fields'] = self.fields
		super(EmployeePositionsSerializer, self).__init__(cursor, **kwargs)

	# We ommit fields because we want all of the data from the query
	fields = [
	]


if __name__ == '__main__':
	import pyodbc
	conn = pyodbc.connect('DSN=MySQL-TEST')
	cursor = conn.execute('SELECT * FROM employee')
	els = EmployeeListSerializer(cursor, many=True)
	print(els.data)
