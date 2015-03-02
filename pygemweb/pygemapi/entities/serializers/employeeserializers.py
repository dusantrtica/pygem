from __future__ import unicode_literals

class Serializer(object):
	def __init__(self, cursor, **kwargs):
		self.many = kwargs.get('many', False)
		self.cursor = cursor
		self.fields = kwargs.get('fields', None)

	@property
	def data(self):
		columns = [column[0] for column in self.cursor.description if column[0].lower() in self.fields]
		results = []
		for row in self.cursor.fetchall():
			results.append(dict(zip(columns, map(lambda x:row.__getattribute__(x), columns))))

		if not self.many:
			return results[0]
		else:
			return results


# Class that takes pyodbc result set and returns python dict
class EmployeeListSerializer(Serializer):
	def __init__(self, cursor, **kwargs):
		kwargs['fields'] = self.fields
		super(EmployeeListSerializer, self).__init__(cursor, **kwargs)

	fields = [
	    'employeeid',
		'employeefirstname',
		'employeesurname'
	]

class EmployeeSerializer(Serializer):
	def __init__(self, cursor, **kwargs):
		kwargs['fields'] = self.fields
		super(EmployeeSerializer, self).__init__(cursor, **kwargs)

	fields = [
		'employeeid',
		'employeefirstname',
		'employeesurname',
		'employeelbo',
		'employeejmbg'
	]
	

if __name__ == '__main__':
	import pyodbc
	conn = pyodbc.connect('DSN=MySQL-TEST')
	cursor = conn.execute('SELECT * FROM employee')
	els = EmployeeListSerializer(cursor, many=True)
	print(els.data)
