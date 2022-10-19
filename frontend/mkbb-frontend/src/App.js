import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import NavbarComp from './Components/NavbarComponent';
import {Container} from 'react-bootstrap';
import create_listing from './Components/logo/create_listing.svg'
import switch_img from './Components/logo/switch.svg'
import keyboard from './Components/logo/keyboard.svg'

function App() {
  return (
    <div className="App">
        <NavbarComp></NavbarComp>
        <Container style={{'padding-top': '10%'}}>
          <Container >
          <button style={{'font-size' : '30px'}} type="button" class="btn btn-outline-secondary"> 
          <img
          src = {switch_img} width = '100' height = '100' margin-left = '0%'/>
          Create Parts List</button>
          </Container>
          <Container style={{'padding-top': '5%'}}>
          <button style={{'font-size' : '30px'}} type="button" class="btn btn-outline-secondary"> 
          <img
          src = {keyboard} width = '100' height = '100'
          fill = '#AFE4C2'/>
          Browse Prebuilts</button>
          </Container>
          <Container style={{'padding-top': '5%'}}>
          <button style={{'font-size' : '30px'}} type="button" class="btn btn-outline-secondary">
          <img
          src = {create_listing} width = '100' height = '100'/>
            Advertise Listing</button>

          </Container>
        </Container>
    </div>
  );
}

export default App;