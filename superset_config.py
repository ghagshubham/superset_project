import os

# -------------------------------
# Superset Secret Key
# -------------------------------
SECRET_KEY = os.environ.get(
    "SUPERSET_SECRET_KEY", 
    "150110d459737f62606d36486624e93237f2eee4a8b1e181028c930ef7715b0a"
)

# -------------------------------
# Database Configuration
# -------------------------------
SQLALCHEMY_DATABASE_URI = os.environ.get(
    "SQLALCHEMY_DATABASE_URI",
    "postgresql://postgres:ubyOLqmatwnWAOFzePhJtpNfViJspotB@postgres.railway.internal:5432/railway"
)

# -------------------------------
# Redis (for caching & async queries)
# -------------------------------
REDIS_URL = os.environ.get(
    "REDIS_URL",
    "redis://:fkTjgmjbobCFvRgNcvcTsRTVKjdJQuQM@redis.railway.internal:6379/0"
)

CACHE_CONFIG = {
    "CACHE_TYPE": "RedisCache",
    "CACHE_DEFAULT_TIMEOUT": 300,
    "CACHE_KEY_PREFIX": "superset_",
    "CACHE_REDIS_URL": REDIS_URL,
}

CELERY_CONFIG = {
    "broker_url": REDIS_URL,
    "result_backend": REDIS_URL,
}

# -------------------------------
# Optional Feature Flags
# -------------------------------
FEATURE_FLAGS = {
    "SIP_38_ENABLED": True,
}
