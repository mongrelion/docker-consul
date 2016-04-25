FROM alpine:3.3

MAINTAINER Carlos León <mail@carlosleon.info>

#RUN apk update
ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip /tmp/consul.zip
ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_web_ui.zip /tmp/web_ui.zip

# Add Consul Data Directory
RUN mkdir -p /var/lib/consul

# Install the consul agent and web ui.
RUN unzip /tmp/consul.zip -d /usr/local/bin/
RUN unzip /tmp/web_ui.zip -d /var/lib/consul/webui/
RUN chmod +x /usr/local/bin/consul

# Expose the service ports:
# Port Info: https://consul.io/docs/agent/options.html#ports
EXPOSE 8300 8301 8302 8400 8500 8600/udp

# Set the entrypoint to be a simple agent.
ENTRYPOINT ["/usr/local/bin/consul", "agent", "-data-dir", "/var/lib/consul"]
