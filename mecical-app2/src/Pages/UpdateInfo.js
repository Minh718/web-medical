import React, { useState } from 'react'
import { Button, Col, FormGroup, Input, Label, Row, Form } from 'reactstrap'
import "./style.css"
import { Link } from 'react-router-dom'
import { registerUser, updateUserInfo } from '../apiRequest'
import { useNavigate } from "react-router-dom";
import { useGlobalContext } from '../context'


export default function UpdateInfo() {
  const navigate = useNavigate();
  const {user} = useGlobalContext()
  console.log(user)
  const [fname, setFname] = useState(user.fname)
  const [minit, setMinit] = useState(user.minit)
  const [lname, setLname] = useState(user.lname)
  const [birthdate, setBirthdate] = useState(changeDateFormatYMD(user.birthdate))
  const [gender, setGender] = useState(user.gender)
  const [email, setEmail] = useState(user.email)
  const [phone, setPhone] = useState(user.phone_num)
  const [address, setAddress] = useState(user.addr)
  const [error, setError] = useState("")
  function formatDM(value){
    if (parseInt(value) < 10){
        return '0' + value;
    }
    return value
  }
  function changeDateFormatYMD(inputDate) {
    const dateObj = new Date(inputDate);
    
    if (!isNaN(dateObj.getTime())) {
      const day = dateObj.getDate();
      const month = dateObj.getMonth() + 1; // Tháng bắt đầu từ 0
      const year = dateObj.getFullYear();
      
      const formattedDate = `${year}-${formatDM(month)}-${formatDM(day)}`;
      
      return formattedDate;
    } else {
      return "Invalid date";
    }

  }
  function changeDateFormatDMY(inputDate) {
    const dateObj = new Date(inputDate);
    
    if (!isNaN(dateObj.getTime())) {
      const day = dateObj.getDate();
      const month = dateObj.getMonth() + 1; // Tháng bắt đầu từ 0
      const year = dateObj.getFullYear();
      
      const formattedDate = `${formatDM(day)}-${formatDM(month)}-${year}`;
      
      return formattedDate;
    } else {
      return "Invalid date";
    }

  }
  const handleUpdateUser = async () => {
  const response = await updateUserInfo({id: user.id, fname, minit, lname, gender, birthdate: changeDateFormatDMY(birthdate), address, email, phone})
  if(response.status === 500){
    setError(response.data.error.sqlMessage)
  }
  else{
    setError("Chỉnh sửa thông tin thành công")

    // navigate("/login");
  }
}
  return (
    <div className='registerContainer'>
<Form className='formRegister'>
      <h1>Chỉnh sửa thông tin</h1>
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
  <Button onClick={handleUpdateUser}>
    Lưu thây đổi
  </Button>
</Form>
</div>
  )
}
