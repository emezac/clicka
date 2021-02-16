import React, {Component} from 'react';
import  Vehicles from './components/vehicles';

class App extends Component {
    render() {
        return (
            <Vehicles vehicles={this.state.vehicles} />
        )
    }

    state = {
        vehicles: []
    };

    componentDidMount() {
        fetch('http://localhost:3000/vehicles/search')
            .then(res => res.json())
            .then((data) => {
                this.setState({ vehicles: data })
            })
            .catch(console.log)
    }
}

export default App;
