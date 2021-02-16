# FullStack Ruby and React Developer Interview

This Test has the goal to create a basic API that is able to:

1. In an API:
  - Create VehicleModels
  - Create Vehicles associated with the respective VehicleModel
  - Search for Vehicles listed, using filters for VehicleModel and VehicleBrand.
2. Frontend
  - Create and search page, to search for vehicles ins the API created in step 1
  
3. You can use the `populate.rb` as a seed file to have some data to work with, or you can create your on data.

## Task 1 - Build the APP Structure
Create a new `Rails API` app with the last Rails Version and Ruby > 2.6.6 

This app must contain tree models with the following structure:
```
VehicleBrand = {
  id: number,
  name: (VW, Chevrolet, BMW)
}

VehicleModel = {
  id: number
  brand_id: (Reference to VehicleBrand Model)
  name: (Golf, Ranger, Corolla)
}

Vehicle = {
  id: number
  model_id: (Reference to VehicleModel Model)
  year: (Vehicle year)
  mileage: (Vehicle Mileage)
  price: integer (Price the vehicles is listed for same)
}

```

## Task 2 - Build the API Private Endpoints

All API endpoints must return in JSON format, when successfully return the new register structure or if fail return the error messages.

 
### 1. Create an Endpoint to Add VehicleModels

This endpoint must receive a POST request in the following format:
```
{
  name: "Golf",
  brand: "VW",
}
```
 - Validate the presence of all fields
 - Do not accept duplicated names
 - If the brand does not match with the ones in the VehicleBrand Model, create this in the `VehicleBrand` Model.

### 2. Create an EndPoint to Add Vehicles to Vehicle Model

This endpoint must receive a POST request in the following format:
```
{
  brand: "VW",
  model: "Golf",
  year: "2020",
  price: 100000
}
```
 - Validate the presence of all fields
 - Create the association with VehicleModel from the `model` name included in the API call.
 

 ## Task 3 - Search Vehicle Endpoint
 With all the above Tasks ready:
 
 - Create a public endpoint that will return a list of vehicles with the following format:
 ```
 [
   {   id: 1,
       model_name: "Golf",
       brand_name: "VW",
       year: 2020,
       mileage : 30000,
       price: 100000
    },
   {   id: 2,
       model_name: "Golf",
       brand_name: "VW",
       year: 2018,
       mileage : 20000,
       price: 100000
    },

 ]
 ```
- The Endpoint must allow filter results with the following parameters: `model_name`, `brand_name`, greather than `year`, lower than `mileage`, lower than `price`

## Task 4 - Frontend
1. Create a new React App using `create-react-app`: https://create-react-app.dev/

2. Create a Page that must to contain an `input field`, a list of options with (model, brand, year, mileage and price), and a `button`.

3. When  the user types a string in the `input field`, select the option in the list of attributes and click in the `button` the component must to trigger a call for the Search API you created in the previous steps and return only the vehicles that match with the search:

Sample:
```
INPUT: VW
OPTION: BRAND
Result: All brand that match the input string VW, VWS, etc

INPUT: Golf
OPTION: MODEL
Result: All models than match Golf string:  GOLF, GOLFIE, etc


INPUT: Gol
OPTION: MODEL
Result: All models than match Gol string: GOL, GOLF, etc.

INPUT: 10000
OPTION: Mileage
Result: mileage lower than or equal 10000

INPUT: 10000
OPTION: Price
Result: price lower than or equal 10000

INPUT: 2018
OPTION: Year
Result: vehicles of 2018 or Newer
```

#### Requirements:
- You should handle Upercase and Lowercase strings either
- You must to handle the LOADING state and display an loader image or spinner before display the results
- You can use `fech` or `axios`
- You should apply CSS Styles, or use an UI library of your choise, in order to make the App Looks nice.
- You can build this structure with as many components as you think is required.
- Bonus Point to use `React Hooks`(but it is not required, you can use Class Components as well)