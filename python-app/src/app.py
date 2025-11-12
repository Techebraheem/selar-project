# /apps/sample-api/src/app.py

from flask import Flask, jsonify
import os

# Set up the Flask application
app = Flask(__name__)

# The required /health endpoint
@app.route('/health', methods=['GET'])
def health_check():
    """Returns a simple JSON status to indicate the application is running."""
    # Kubernetes readiness/liveness probes look for a 200 response
    return jsonify({'status': 'healthy', 'version': '1.0.0'}), 200

# The main application endpoint
@app.route('/', methods=['GET'])
def home():
    """Returns a welcome message."""
    return jsonify({
        'message': 'Welcome to the Sample Cloud-Native API!',
        'environment': os.environ.get('K8S_ENV', 'local'),
        'service': 'sample-api'
    }), 200

if __name__ == '__main__':
    # Use 0.0.0.0 to listen on all public IPs, and 8080 as defined by convention
    app.run(host='0.0.0.0', port=8080)
