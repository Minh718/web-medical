import React, { useEffect, useState } from 'react'
import { Form } from 'react-router-dom';
import { Button, Col, Input, Label, Pagination, PaginationItem, PaginationLink, Row, Table } from 'reactstrap'
import { getClinics, getPeopleInMonth } from '../../../apiRequest';

export default function PeopleInMonth() {

    const [peopleInMonth, setPeopleInMonth] = useState(null);
    console.log(peopleInMonth)
    const [clinics, setClinics] = useState(null);
    const [clinic, setClinic] = useState("");
    const [month, setMonth] = useState("");
    const handleGetPeopleInMonth = async ()=>{
        const response = await getPeopleInMonth({id: clinic, month})
        setPeopleInMonth(response.data[0])

    }
    useEffect(() => {
        (async () => {
           const response = await getClinics();
          setClinics(response.data)
        })();
      }, []);

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
      return (
    <div style={{padding: "20px"}}>

<Form style={{marginBottom: "20px"}}>
  <Row className="row-cols-lg-auto g-3 align-items-center">
    <Col>
    <Input
      name="phongkham"
      type="select"
      value={clinic}
      onChange={(e)=> setClinic(e.target.value)}
    >
    <option value={""}>
       Chọn phòng khám
     </option> 
        {clinics?.map((cli)=>(
       <option key={cli.id} value={cli.id}>
       {cli._name}
     </option>
        ))}
    </Input>
    </Col>
    <Col>
    <Label
        className="visually-hidden"
        for="month"
      >
        Chọn tháng
      </Label>
      <Input
        name="month"
        placeholder="Chọn Tháng từ 1-12"
        value={month}
        onChange={(e)=> setMonth(e.target.value)}
      />
    </Col>
      <Button onClick={handleGetPeopleInMonth}>
        Lấy danh sách
      </Button>
  </Row>
</Form>
{!peopleInMonth?"":<Table
  bordered
  hover
  striped
>
  <thead>
    <tr>
      <th>
        #
      </th>
      <th>
        Họ và tên
      </th>
      <th>
        Ngày sinh
      </th>
      <th>
        Email
      </th>
      <th>
        Số điện thoại
      </th>
      <th>
        Số lần khám trong tháng
      </th>
    </tr>
  </thead>
  <tbody>
    {
        peopleInMonth?.map((user, index)=>(
            <tr key={user.id}>
            <th scope="row">
              {index}
            </th>
            <td>
              {user.fname + " " + user.minit + " " + user.lname}
            </td>
            <td>
              {changeDateFormat(user.birthdate)}
            </td>
            <td>
              {user.email}
            </td>
            <td>
              {user.phone_num}
            </td>
            <td>
              {user.lankham}
            </td>
          </tr>
        ))
    }
  </tbody>
</Table>}
{/* <Pagination onClick={(e)=> console.log(e.target.innerText)}>
  <PaginationItem>
    <PaginationLink
      first
      href="#"
    />
  </PaginationItem>
  <PaginationItem>
    <PaginationLink
      href="#"
      previous
    />
  </PaginationItem>
  <PaginationItem active>
    <PaginationLink href="#">
      1
    </PaginationLink>
  </PaginationItem>
  <PaginationItem>
    <PaginationLink href="#">
      2
    </PaginationLink>
  </PaginationItem>
  <PaginationItem>
    <PaginationLink href="#">
      3
    </PaginationLink>
  </PaginationItem>
  <PaginationItem>
    <PaginationLink href="#">
      4
    </PaginationLink>
  </PaginationItem>
  <PaginationItem>
    <PaginationLink href="#">
      5
    </PaginationLink>
  </PaginationItem>
  <PaginationItem>
    <PaginationLink
      href="#"
      next
    />
  </PaginationItem>
  <PaginationItem>
    <PaginationLink
      href="#"
      last
    />
  </PaginationItem>
</Pagination> */}
    </div>
  )
}
