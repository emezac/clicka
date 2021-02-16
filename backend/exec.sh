curl -X POST -H "Content-Type: application/json" \
    -d '{"name": "VW"}' \
    http://localhost:3000/vehiclebrands

curl -X POST -H "Content-Type: application/json" \
    -d '{"name": "Golf", "brand": "VW" }' \
    http://localhost:3000/vehiclemodels

curl -X POST -H "Content-Type: application/json" \
    -d '{"name": "Golfy" }' \
    http://localhost:3000/vehiclemodels

curl -X POST -H "Content-Type: application/json" \
    -d '{"brand": "VW", "model": "Golf", "year": "2019", "price": "100000", "mileage": "67363" }' \
    http://localhost:3000/vehicles

curl -X POST -H "Content-Type: application/json" \
    -d '{"brand": "VW", "model": "Golf", "year": "2020", "price": "110000", "mileage": "67363" }' \
    http://localhost:3000/vehicles
curl -X POST -H "Content-Type: application/json" \
    -d '{"brand": "VW", "model": "Golf", "year": "2021", "price": "120000", "mileage": "67363" }' \
    http://localhost:3000/vehicles

curl -X GET -H "Content-Type: application/json" \
    -d '{"model_name": "Golf"}' \
    http://localhost:3000/vehicles#search
