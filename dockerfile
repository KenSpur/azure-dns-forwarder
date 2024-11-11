# Use Alpine Linux as base
FROM alpine:latest

# Install dnsmasq
RUN apk --no-cache add dnsmasq

# Expose port 53 (DNS)
EXPOSE 53/udp
EXPOSE 53/tcp

# Create dnsmasq config directory
RUN mkdir -p /etc/dnsmasq.d

# Copy a simple dnsmasq configuration to forward DNS queries
COPY dnsmasq.conf /etc/dnsmasq.conf

# Start dnsmasq in the foreground
CMD ["dnsmasq", "-k"]
