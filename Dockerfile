FROM apache/superset:latest

# Use root to install packages
USER root

# Install PostgreSQL driver + Pillow
RUN pip install --no-cache-dir psycopg2-binary Pillow

# Copy startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Change back to superset user
USER superset

# Set secret key
ENV SUPERSET_SECRET_KEY='99b0V3oCt99AzUVqNDTrd38cumra2Fs3ocHIBQ-nUpg'

# Expose port
EXPOSE 8080

# Start Superset (all init done on container start)
CMD ["/app/start.sh"]
