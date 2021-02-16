curl -X GET -H "Content-Type: application/json" \
    http://localhost:3000/vehicles/search?VW&page=1


curl -X GET -H "Content-Type: application/json" \
    -d '{"brand_name": "Apollo"}' \
    http://localhost:3000/vehicles/search

curl -X GET -H "Content-Type: application/json" \
    -d '{"model_name": "Ansel Adams"}' \
    http://localhost:3000/vehicles/search

curl -X GET -H "Content-Type: application/json" \
    -d '{"year": "5020"}' \
    http://localhost:3000/vehicles/search

curl -X GET -H "Content-Type: application/json" \
    -d '{"mileage": "20000"}' \
    http://localhost:3000/vehicles/search

curl -X GET -H "Content-Type: application/json" \
    -d '{"price": "150000"}' \
    http://localhost:3000/vehicles/search
