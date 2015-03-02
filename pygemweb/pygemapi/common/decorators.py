import ipdb

def serialize(**kwargs):
	def real_decorator(dataset_func):
		def wrapper(*rd_args, **rd_kwargs): # rd_ stands for arguments for real decorator that invokes dataset_func
			cursor = dataset_func(*rd_args, **rd_kwargs)
			serializer_class = kwargs.get('serializer_class')			
			serializer = serializer_class(cursor, **kwargs)			
			return serializer.data

		return wrapper
	return real_decorator	
