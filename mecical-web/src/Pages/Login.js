import React, { useState } from 'react'
import { Button, Col, FormGroup, Input, Label, Row, Form } from 'reactstrap'
import "./style.css"
import { Link, useNavigate } from 'react-router-dom'
import { loginUser } from '../apiRequest'
import { useGlobalContext } from '../context'
export default function Login() {
  const navigate = useNavigate();

  const [username, setUsername] = useState("")
  const [password, setPassword] = useState("")
  const [error, setError] = useState("")
  const {setUser} = useGlobalContext();
  const handleLogin = async () => {
    // console.log(username, password)
    const response = await loginUser({username, password})
    if(response.status === 500){
      setError(response.data.error.sqlMessage)
    }
    else{
    setUser(response.data[0][0]);
      navigate("/");
    }
  }
  return (
    <div className='registerContainer'>
<Form className='formLogin'>
      <h1>Login</h1>
      <p>{error}</p>
  <FormGroup>
    <Label for="Username">
      Username
    </Label>
    <Input
      id="Username"
      value={username}
      name="Username"
      placeholder="Tên đăng nhập ...."
      onChange={(e)=> setUsername(e.target.value)}
    />
  </FormGroup>
  <FormGroup>
    <Label for="Password">
      Password
    </Label>
    <Input
      id="Password"
      name="Password"
      placeholder="Nhập password .... "
      value={password}
      type='password'
      onChange={(e)=> setPassword(e.target.value)}

    />
  </FormGroup>
  <Button onClick={handleLogin}>
    Đăng nhập
  </Button>
  <Link to="/register" className='gotoRegister'>
               Đi đến đăng ký
            </Link>
</Form>
</div>
  )
}