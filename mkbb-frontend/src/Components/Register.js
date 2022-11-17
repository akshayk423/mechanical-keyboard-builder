import {Form,Card,Button,Container} from "react-bootstrap"
import NavbarComp from "./Navbar/NavbarComponent";
import './Login.css'

function Register(){

    return(
        <div>
        <NavbarComp></NavbarComp>
        <Container style={{'padding-top': '5%'}}>
        <div className="color-overlage d-flex justify-content-center align-items-center">
        <Card>
            <Form className="rounded p-4 p-sm-3">
                <Form.Group className="mb-3" controlId="formUserName">
                    <Form.Label>Username</Form.Label>
                    <Form.Control type="text" placeholder="Enter Username"/>
                </Form.Group>

                <Form.Group className="mb-3" controlId="userPhonenumber">
                    <Form.Label>Phone Number</Form.Label>
                    <Form.Control type="tel" placeholder="(000)-000-0000"/>
                </Form.Group>

                <Form.Group className="mb-3" controlId="formPass">
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" placeholder="Enter Password"/>
                </Form.Group>

                <Container>
                    <a href="/login" type="button" className="btn btn-primary">Login</a>{" "}
                    <button className="btn btn-warning">Submit</button>
                </Container>
            </Form>
        </Card>
        </div>
        </Container>
        </div>
       
    )
}

export default Register;