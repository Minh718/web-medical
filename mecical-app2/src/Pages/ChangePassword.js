import React, { useState } from 'react'
import { Button, Form, FormGroup, Input, Label } from 'reactstrap'
import { changePassword } from '../apiRequest'
import { useGlobalContext } from '../context'
import "./style.css"
export default function ChanngePassword() {

  const [password, setPassword] = useState("")
  const [newPassword, setNewPassword] = useState("")
  const [error, setError] = useState("")
  const {user} = useGlobalContext();
  const handleChangePassword = async () => {
    const response = await changePassword({id: user.id, password, newPassword})
    if(response.status === 500){
      setError(response.data.error.sqlMessage)
    }
    else{
        setError("Thay đổi mặt khẩu thành công")
    }
  }
  return (
    <div className='registerContainer'>
<Form className='formLogin'>
      <h1>Thây đổi mật khẩu</h1>
      <p>{error}</p>
  <FormGroup>
    <Label for="Password">
      Mật khẩu hiện tại
    </Label>
    <Input
      id="Password"
      value={password}
      name="Password"
      type='password'

      placeholder="Nhập mật khẩu hiện tại ...."
      onChange={(e)=> setPassword(e.target.value)}
    />
  </FormGroup>
  <FormGroup>
    <Label for="Password">
      Mật khẩu mới
    </Label>
    <Input
      id="Password"
      name="Password"
      placeholder="Nhập mật khẩu mới .... "
      value={newPassword}
      type='password'
      onChange={(e)=> setNewPassword(e.target.value)}

    />
  </FormGroup>
  <Button onClick={handleChangePassword}>
    Lưu thay đổi
  </Button>
</Form>
</div>
  )
}