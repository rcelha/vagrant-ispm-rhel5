#!/bin/sh

source /tmp/provisioner-base.sh;
print_debug configure-service-status.sh

restart_service nginx;
add_service_boot nginx;

restart_service rabbitmq-server;
add_service_boot rabbitmq-server;
