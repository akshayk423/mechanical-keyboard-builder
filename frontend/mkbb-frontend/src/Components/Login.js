import {Form,Container,Button,Card} from "react-bootstrap"
import NavbarComp from "./Navbar/NavbarComponent"
import './Login.css'
import {BrowserRouter as Routes,Route} from "react-router-dom"
import Register from './Register'
function Login(){
    return(
        <div>
            <NavbarComp></NavbarComp>
            <Container style={{'padding-top': '5%'}}>
            <div class="color-overlage d-flex justify-content-center align-items-center">
            <Card>
                <Form className="rounded p-4 p-sm-3">
                    <Form.Group className="mb-3" controlId="formUserName">
                    <Form.Label>Username</Form.Label>
                    <Form.Control type="text" placeholder="Enter Username"
                    />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="formPass">
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" placeholder="Enter Password"/>
                    </Form.Group>
                    <Container>
                        <a href="/register" type="button" class="btn btn-primary">Register</a>{" "}
                        <button class="btn btn-warning">Sign In</button>
                    </Container>

                </Form>
            </Card>
            </div>
            </Container>

           
        </div>
    )
}

export default Login;