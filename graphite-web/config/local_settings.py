import os
from datetime import datetime

LOG_DIR = '/var/log/graphite'

if os.getenv("CLUSTER_SERVERS"):
    CLUSTER_SERVERS = os.getenv("CLUSTER_SERVERS").split(',')

SECRET_KEY = str(datetime.now())
