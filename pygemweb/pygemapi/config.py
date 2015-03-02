import os
class Config(object):
	DEBUG = False
	TESTING = False
	CSRF_ENABLED = True
	SECRET_KEY = 'this-really-needs-to-be-changed'
	# TODO: Database URI needs to be set as environvariable or
	# we could make odbc record in odbc.ini that contain everything
	DATABASE_URI = os.environ.get('DATABASE_URL', 'DSN=MySQL-TEST')

class ProductionConfig(Config):
	DEBUG = False

class StagingConfig(Config):
	DEVELOPMENT = True
	DEBUG = True

class DevelopmentConfig(Config):
	DEVELOPMENT = True
	DEBUG = True

class TestingConfig(Config):
	TESTING = True


# In the post setup we should add
# export APP_SETTINGS = 'config.DevelopmentConfig'