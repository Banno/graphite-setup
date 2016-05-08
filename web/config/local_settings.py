import os
import json, requests
from datetime import datetime

LOG_DIR = '/var/log/graphite'
if os.getenv("CARBONLINK_HOSTS"):
    CARBONLINK_HOSTS = os.getenv("CARBONLINK_HOSTS").split(',')

if os.getenv("CLUSTER_SERVERS"):
    CLUSTER_SERVERS = os.getenv("CLUSTER_SERVERS").split(',')
elif os.getenv("RANCHER_GRAPHITE_CLUSTER_SERVICE_NAME"):
    rancher_carbonlink_service_url = "http://rancher-metadata/2015-12-19/services/%s/containers" % os.getenv("RANCHER_GRAPHITE_CLUSTER_SERVICE_NAME")
    r = requests.get(rancher_carbonlink_service_url, headers={"Accept": "application/json"}).json()
    r = map(lambda x: x["primary_ip"] + ":80", r)
    CLUSTER_SERVERS = [str(x) for x in r]

if os.getenv("MEMCACHE_HOSTS"):
    CLUSTER_SERVERS = os.getenv("MEMCACHE_HOSTS").split(',')

if os.getenv("WHISPER_DIR"):
    WHISPER_DIR = os.getenv("WHISPER_DIR")

SECRET_KEY = str(datetime.now())
