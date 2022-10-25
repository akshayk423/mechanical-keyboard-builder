import {Form,Container,Button} from "react-bootstrap"
import NavbarComp from "./Navbar/NavbarComponent"
import './Login.css'
function Login(){
    return(
        <div>
            <NavbarComp></NavbarComp>
            <Container style={{'padding-top': '5%'}}>
            <div class="color-overlage d-flex justify-content-center align-items-center">
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
                        <button class="btn btn-primary">Register</button>{" "}
                        <button class="btn btn-warning">Sign In</button>
                    </Container>
                </Form>
            </div>
            </Container>
        </div>
    )
}

export default Login;