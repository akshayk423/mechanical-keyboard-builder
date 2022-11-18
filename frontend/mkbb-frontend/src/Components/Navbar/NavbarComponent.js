import React, {Component} from 'react'
import {Navbar, Nav, NavDropdown,Container} from 'react-bootstrap'
import "./Navbar.css"
import logo from './logo.png'
export default class NavbarComp extends Component {
    render() {
        return (
            <div>
                  <Navbar className= "color-nav" expand="lg">
      <Container>
        <Navbar.Brand href="/">
            <img 
              alt=""
              src={logo}
              width="50"
              height="50"
              /> 
              Mechanical Keyboard Builder
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <Nav.Link href="/">Home</Nav.Link>
            <Nav.Link href="/login">Login</Nav.Link>
            
          </Nav>
        </Navbar.Collapse>
        
      </Container>
   
    </Navbar>
            </div>
        )
    }

}