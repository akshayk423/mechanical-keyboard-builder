import React, {Component} from 'react'
import {Navbar, Nav, NavDropdown,Container} from 'react-bootstrap'
import "./Navbar.css"
import logo from './logo/logo.png'
export default class NavbarComp extends Component {
    render() {
        return (
            <div>
                  <Navbar className= "color-nav" expand="lg">
      <Container>
        <Navbar.Brand href="#home">
            <img 
              alt=""
              src={logo}
              width="40"
              height="40"
              /> 
              Mechanical Keyboard Builder
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <Nav.Link href="#home">Home</Nav.Link>
            <Nav.Link href="#link">Login</Nav.Link>
            <NavDropdown title="Dropdown" id="basic-nav-dropdown">
              <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
              <NavDropdown.Item href="#action/3.2">
                Another action
              </NavDropdown.Item>
              <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
              <NavDropdown.Divider />
              <NavDropdown.Item href="#action/3.4">
                Separated link
              </NavDropdown.Item>
            </NavDropdown>
          </Nav>
        </Navbar.Collapse>
        
      </Container>
   
    </Navbar>
            </div>
        )
    }

}