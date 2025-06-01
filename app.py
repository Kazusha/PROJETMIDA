from flask import Flask
from flask_cors import CORS
from models import db
from routes.notification_routes import notification_bp
from routes.reservation_routes import reservation_bp
from routes.admin_routes import admin_bp
from routes.client_routes import client_bp
from routes.film_routes import film_bp
from routes.seance_routes import seance_bp
from routes.salle_routes import salle_bp

app = Flask(__name__)
CORS(app)

# Configuration de la base de données
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/homestudio'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialisation de la base de données
db.init_app(app)

# Enregistrement des blueprints
app.register_blueprint(notification_bp, url_prefix='/notification')
app.register_blueprint(reservation_bp, url_prefix='/reservation')
app.register_blueprint(admin_bp, url_prefix='/admin')
app.register_blueprint(client_bp, url_prefix='/client')
app.register_blueprint(film_bp, url_prefix='/film')
app.register_blueprint(seance_bp, url_prefix='/seance')
app.register_blueprint(salle_bp, url_prefix='/salle')

# Création des tables
with app.app_context():
    db.create_all()

if __name__ == '__main__':
    app.run(debug=True) 