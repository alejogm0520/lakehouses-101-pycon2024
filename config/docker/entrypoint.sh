#bin/bash
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::");
/home/PyCon2024/venv/bin/jupyter lab --allow-root --no-browser --ip=0.0.0.0