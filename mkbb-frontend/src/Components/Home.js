import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import '../App.css';
import NavbarComp from "./Navbar/NavbarComponent";
import {Container} from 'react-bootstrap';
import create_listing from './logo/create_listing.svg'
import switch_img from './logo/switch.svg'
import keyboard from './logo/keyboard.svg'
function Home() {

    return(
        <div className="Home">
        <NavbarComp></NavbarComp>
        <Container style={{'padding-top': '5%'}}>
          <Container >
            <div className="col-md-12 text-center">
            <a href="/partslist" style={{'font-size' : '30px'}} type="button" className="btn btn-outline-secondary"> 
            <img
            src = {switch_img} width = '100' height = '100' margin-left = '0%'/>
            Create Parts List</a>
            </div>
          </Container>

          <Container style={{'padding-top': '5%'}}>
            <div className="col-md-12 text-center">
            <button style={{'font-size' : '30px'}} type="button" className="btn btn-outline-secondary"> 
            <img
            src = {keyboard} width = '100' height = '100'
            fill = '#AFE4C2'/>
            Browse Prebuilts</button>
            </div>
          </Container>

          <Container style={{'padding-top': '5%'}}>
            <div className="col-md-12 text-center">

            <button  style={{'font-size' : '30px'}} type="button" className="btn btn-outline-secondary">
            <img
            src = {create_listing} width = '100' height = '100'/>
                Advertise Listing</button>
            </div>
          </Container>
        </Container>
     </div>
    )
}

export default Home;