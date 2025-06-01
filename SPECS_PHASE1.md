# Spécifications Techniques - Phase 1

## 1. Système d'Authentification JWT

### 1.1 Backend (Python/Flask)
```python
# Dépendances à ajouter dans requirements.txt
flask-jwt-extended==4.5.2
bcrypt==4.0.1
python-dotenv==1.0.0

# Configuration JWT
JWT_SECRET_KEY = os.environ.get('JWT_SECRET_KEY')
JWT_ACCESS_TOKEN_EXPIRES = timedelta(hours=1)
JWT_REFRESH_TOKEN_EXPIRES = timedelta(days=30)
```

### 1.2 Endpoints d'Authentification
```python
@auth_bp.route('/login', methods=['POST'])
def login():
    # Validation des données
    # Vérification des credentials
    # Génération des tokens
    return {
        'access_token': access_token,
        'refresh_token': refresh_token
    }

@auth_bp.route('/refresh', methods=['POST'])
@jwt_required(refresh=True)
def refresh():
    # Rafraîchissement du token
    return {'access_token': new_access_token}
```

### 1.3 Middleware de Protection
```python
@jwt_required()
def protected_route():
    # Vérification du token
    current_user = get_jwt_identity()
    # Suite du traitement
```

## 2. Intégration Stripe

### 2.1 Configuration
```python
# requirements.txt
stripe==6.1.0

# config.py
STRIPE_SECRET_KEY = os.environ.get('STRIPE_SECRET_KEY')
STRIPE_PUBLIC_KEY = os.environ.get('STRIPE_PUBLIC_KEY')
STRIPE_WEBHOOK_SECRET = os.environ.get('STRIPE_WEBHOOK_SECRET')
```

### 2.2 Endpoints de Paiement
```python
@payment_bp.route('/create-payment-intent', methods=['POST'])
@jwt_required()
def create_payment():
    try:
        # Création de l'intention de paiement
        intent = stripe.PaymentIntent.create(
            amount=calculate_amount(reservation),
            currency='eur',
            metadata={'reservation_id': reservation.id}
        )
        return {'client_secret': intent.client_secret}
    except Exception as e:
        return {'error': str(e)}, 400

@payment_bp.route('/webhook', methods=['POST'])
def webhook():
    # Gestion des webhooks Stripe
    # Mise à jour du statut de réservation
    pass
```

### 2.3 Frontend (React/TypeScript)
```typescript
// services/payment.ts
export const processPayment = async (
  reservation_id: number,
  payment_method_id: string
): Promise<PaymentResult> => {
  const response = await api.post('/payment/process', {
    reservation_id,
    payment_method_id
  });
  return response.data;
};
```

## 3. Optimisations de Performance

### 3.1 Lazy Loading des Images
```typescript
// components/Image.tsx
import { LazyLoadImage } from 'react-lazy-load-image-component';

export const OptimizedImage: React.FC<ImageProps> = ({
  src,
  alt,
  width,
  height
}) => (
  <LazyLoadImage
    src={src}
    alt={alt}
    width={width}
    height={height}
    effect="blur"
    placeholderSrc={generatePlaceholder()}
  />
);
```

### 3.2 Optimisation SQL
```python
# Indexation
CREATE INDEX idx_film_titre ON film(titre);
CREATE INDEX idx_seance_date ON seance(date_heure);
CREATE INDEX idx_reservation_client ON reservation(client_id);

# Requêtes optimisées
@film_bp.route('/list', methods=['GET'])
def get_films():
    page = request.args.get('page', 1, type=int)
    per_page = request.args.get('per_page', 10, type=int)
    
    films = Film.query\
        .options(joinedload('seances'))\
        .paginate(page=page, per_page=per_page)
    
    return jsonify({
        'items': [film.to_dict() for film in films.items],
        'total': films.total,
        'pages': films.pages
    })
```

### 3.3 Bundle Optimization
```javascript
// webpack.config.js
module.exports = {
  optimization: {
    splitChunks: {
      chunks: 'all',
      minSize: 20000,
      maxSize: 244000,
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name: 'vendors',
          chunks: 'all'
        }
      }
    }
  }
};
```

## 4. Sécurité

### 4.1 Protection CSRF
```python
# requirements.txt
Flask-WTF==1.1.1

# config.py
WTF_CSRF_SECRET_KEY = os.environ.get('CSRF_SECRET_KEY')
```

### 4.2 Validation des Entrées
```python
from marshmallow import Schema, fields, validate

class ReservationSchema(Schema):
    seance_id = fields.Int(required=True)
    nombre_places = fields.Int(required=True, validate=validate.Range(min=1, max=10))
    client_id = fields.Int(required=True)

@reservation_bp.route('/add', methods=['POST'])
@jwt_required()
def add_reservation():
    schema = ReservationSchema()
    try:
        data = schema.load(request.json)
        # Traitement de la réservation
    except ValidationError as err:
        return {'errors': err.messages}, 400
```

### 4.3 Rate Limiting
```python
# requirements.txt
Flask-Limiter==3.5.0

# config.py
RATELIMIT_DEFAULT = "200 per day"
RATELIMIT_STORAGE_URL = "redis://localhost:6379/0"

# Exemple d'utilisation
@limiter.limit("5 per minute")
@auth_bp.route('/login', methods=['POST'])
def login():
    # ...
```

## 5. Monitoring Initial

### 5.1 Logging
```python
# config.py
import logging
from logging.handlers import RotatingFileHandler

def setup_logging(app):
    if not os.path.exists('logs'):
        os.mkdir('logs')
    
    file_handler = RotatingFileHandler(
        'logs/homestudio.log',
        maxBytes=10240,
        backupCount=10
    )
    
    file_handler.setFormatter(logging.Formatter(
        '%(asctime)s %(levelname)s: %(message)s'
    ))
    
    app.logger.addHandler(file_handler)
    app.logger.setLevel(logging.INFO)
```

### 5.2 Métriques de Base
```python
from prometheus_client import Counter, Histogram

# Métriques
REQUEST_COUNT = Counter(
    'request_count',
    'App Request Count',
    ['method', 'endpoint', 'status']
)

REQUEST_LATENCY = Histogram(
    'request_latency_seconds',
    'Request latency',
    ['endpoint']
)

# Middleware
@app.before_request
def before_request():
    g.start_time = time.time()

@app.after_request
def after_request(response):
    REQUEST_COUNT.labels(
        method=request.method,
        endpoint=request.endpoint,
        status=response.status_code
    ).inc()
    
    REQUEST_LATENCY.labels(
        endpoint=request.endpoint
    ).observe(time.time() - g.start_time)
    
    return response
```

## 6. Tests Critiques

### 6.1 Tests Unitaires
```python
# tests/test_auth.py
def test_login_success(client):
    response = client.post('/auth/login', json={
        'email': 'test@test.com',
        'password': 'password123'
    })
    assert response.status_code == 200
    assert 'access_token' in response.json

def test_protected_route_without_token(client):
    response = client.get('/api/protected')
    assert response.status_code == 401
```

### 6.2 Tests d'Intégration
```python
# tests/test_reservation.py
def test_reservation_workflow(client, auth_token):
    # Création d'une réservation
    response = client.post('/reservation/add',
        headers={'Authorization': f'Bearer {auth_token}'},
        json={
            'seance_id': 1,
            'nombre_places': 2
        }
    )
    assert response.status_code == 200
    reservation_id = response.json['id']
    
    # Paiement
    response = client.post('/payment/process',
        headers={'Authorization': f'Bearer {auth_token}'},
        json={
            'reservation_id': reservation_id,
            'payment_method': 'card'
        }
    )
    assert response.status_code == 200
```

## 7. Documentation API

### 7.1 Swagger/OpenAPI
```yaml
openapi: 3.0.0
info:
  title: Homestudio API
  version: 1.0.0
paths:
  /auth/login:
    post:
      summary: Authentification utilisateur
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                email:
                  type: string
                password:
                  type: string
      responses:
        '200':
          description: Login réussi
          content:
            application/json:
              schema:
                type: object
                properties:
                  access_token:
                    type: string
                  refresh_token:
                    type: string
``` 