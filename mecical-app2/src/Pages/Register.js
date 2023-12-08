import React, { useState } from 'react'
import { Button, Col, FormGroup, Input, Label, Row, Form } from 'reactstrap'
import "./style.css"
import { Link } from 'react-router-dom'
import { registerUser } from '../apiRequest'
import { useNavigate } from "react-router-dom";


export default function Register() {
  const navigate = useNavigate();
  const [fname, setFname] = useState("")
  const [minit, setMinit] = useState("")
  const [lname, setLname] = useState("")
  const [birthdate, setBirthdate] = useState("")
  const [gender, setGender] = useState("male")
  const [email, setEmail] = useState("")
  const [phone, setPhone] = useState("")
  const [username, setUsername] = useState("")
  const [password, setPassword] = useState("")
  const [address, setAddress] = useState("")
  const [error, setError] = useState("")

  function changeDateFormat(inputDate) {
    const dateObj = new Date(inputDate);
    
    if (!isNaN(dateObj.getTime())) {
      const day = dateObj.getDate();
      const month = dateObj.getMonth() + 1; // Tháng bắt đầu từ 0
      const year = dateObj.getFullYear();
      
      const formattedDate = `${day}-${month}-${year}`;
      
      return formattedDate;
    } else {
      return "Invalid date";
    }

  }
 
  const handleRegister = async () => {
  const response = await registerUser({fname, minit, lname, gender, birthdate: changeDateFormat(birthdate), address, email, phone, username, password})
  if(response.status === 500){
    console.log(response.data.error.sqlMessage)
    setError(response.data.error.sqlMessage)
  }
  else{
    navigate("/login");
  }
}
  return (
    <div className='registerContainer'>
<Form className='formRegister'>
      <h1>Register</h1>
      <p>{error}</p>
      <Row>
    <Col md={4}>
      <FormGroup>
        <Label for="fname">
          Họ
        </Label>
        <Input
          name="fname"
          value={fname}
          onChange={(e)=>setFname(e.target.value)}
          placeholder='Ex: Hò'
        />
      </FormGroup>
    </Col>
    <Col md={4}>
      <FormGroup>
        <Label for="mnit">
          Tên đệm
        </Label>
        <Input
          id="mnit"
          name="minit"
          value={minit}
          onChange={(e)=>setMinit(e.target.value)}
          placeholder='Ex: Văn'

        />
      </FormGroup>
    </Col>
    <Col md={4}>
      <FormGroup>
        <Label for="lname">
          Tên
        </Label>
        <Input
          id="lname"
          name="Tên"
          value={lname}
          onChange={(e)=>setLname(e.target.value)}
          placeholder='Ex: Tèn'

        />
      </FormGroup>
    </Col>
  </Row>
  <Row>
  <Col md={6}>
  <FormGroup>
    <Label for="gender">
      Giới tinh
    </Label>
    <Input
      name="gender"
      type="select"
      value={gender}
      onChange={(e)=> setGender(e.target.value)}
    >
      <option value="male">
        Nam
      </option>
      <option value="female">
        Nữ
      </option>
      <option value="other" >
        Khác
      </option>
    </Input>
  </FormGroup>
  </Col>
  <Col md={6}>
  <FormGroup>
    <Label for="birthdate">
    Ngày sinh
    </Label>
    <Input
      id="birthdate"
      name="date"
      placeholder="Ngày sinh"
      type="date"
      value={birthdate}
      onChange={(e)=> setBirthdate(e.target.value)}
    />
  </FormGroup>
  </Col>
  </Row>
  <Row>
    <Col md={6}>
      <FormGroup>
        <Label for="email">
          Email
        </Label>
        <Input
          id="email"
          name="email"
          placeholder="Nhập email"
          type="email"
          value={email}
          onChange={(e)=>setEmail(e.target.value)}
        />
      </FormGroup>
    </Col>
    <Col md={6}>
      <FormGroup>
        <Label for="sdt">
          Số điện thoại
        </Label>
        <Input
          id="sdt"
          name="sdt"
          placeholder="Nhập số điện thoại"
          value={phone}
          onChange={(e)=>setPhone(e.target.value)}
        />
      </FormGroup>
    </Col>
  </Row>
  <FormGroup>
    <Label for="Địa chỉ">
      Địa chỉ
    </Label>
    <Input
      name="address"
      placeholder="EX: 1234 Main St"
      value={address}
      onChange={(e)=>setAddress(e.target.value)}
    />
  </FormGroup>
  <Row>
    <Col md={6}>
    <FormGroup>
    <Label for="Username">
     Username
    </Label>
    <Input
      name="Username"
      placeholder="Nhập Username"
      value={username}
      onChange={(e)=>setUsername(e.target.value)}
    />
  </FormGroup>
    </Col>
    <Col md={6}>
    <FormGroup>
    <Label for="password">
     Password
    </Label>
    <Input
      name="password"
      placeholder="Nhập password"
      type='password'
      value={password}
      onChange={(e)=>setPassword(e.target.value)}
    />
  </FormGroup>
    </Col>
  </Row>
  <Button onClick={handleRegister}>
    Đăng ký
  </Button>
  <Link to="/login" className='gotoRegister'>
               Đi đến đăng nhập
            </Link>
</Form>
</div>
  )
}
