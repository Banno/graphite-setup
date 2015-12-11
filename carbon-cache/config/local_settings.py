import os
from datetime import datetime

STORAGE_DIR = "/opt/graphite/storage"
CARBONLINK_HOSTS = [ "127.0.0.1:7002" ]

SECRET_KEY = str(datetime.now())
