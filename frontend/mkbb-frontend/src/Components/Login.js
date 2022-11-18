import {Form,Container,Button,Card} from "react-bootstrap"
import NavbarComp from "./Navbar/NavbarComponent"
import './Login.css'
import {BrowserRouter as Routes,Route} from "react-router-dom"
import { useState } from "react"

import axios from "axios";

function Login(){
    const [user, setUser] = useState({
        username: "",
        password: "",
    });

    const handleChange = (e) => {
        setUser((prev) => ({ ...prev, [e.target.name]: e.target.value }));
      };

    const onSubmit = async (e) => {
        e.preventDefault();
        try {
            console.log(user);
            const res = await axios.put("http://localhost:8800/signIn", user);
            console.log(res.data);
        } catch (err) {
            console.log(err);
        }
    };

    return(
        <div>
            <NavbarComp></NavbarComp>
            <Container style={{'padding-top': '5%'}}>
            <div className="color-overlage d-flex justify-content-center align-items-center">
            <Card>
                <Form className="rounded p-4 p-sm-3">
                    <Form.Group className="mb-3" controlId="formUserName">
                    <Form.Label>Username</Form.Label>
                    <Form.Control onChange={handleChange} type="text" name="username" placeholder="Enter Username"
                    />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="formPass">
                    <Form.Label>Password</Form.Label>
                    <Form.Control onChange={handleChange} type="password" name="password" placeholder="Enter Password"/>
                    </Form.Group>
                    <Container>
                        <a href="/register" type="button" className="btn btn-primary">Register</a>{" "}
                        <button className="btn btn-warning" onClick={onSubmit}>Sign In</button>
                    </Container>

                </Form>
            </Card>
            </div>
            </Container>
        </div>
    )
}

export default Login;