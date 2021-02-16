import React from 'react'

const Vehicles = ({vehicles}) => {
    return (
        <>
        <div>
            <center><h1> Search:</h1></center>
            <input type="text" />
             <button> Search </button>
             <button> Clear </button>
        </div>
        <div>
            <center><h1>Vehicle List</h1></center>
            {vehicles.map((vehicle) => (
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">{vehicle.model_name}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">{vehicle.brand_name}</h6>
                        <p class="card-text">${vehicle.price}</p>
                    </div>
                </div>
            ))}
        </div>
        </>
    )
};

export default Vehicles