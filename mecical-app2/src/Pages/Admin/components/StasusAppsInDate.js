import React, { useEffect, useState } from 'react'
import { Form } from 'react-router-dom';
import { Button, Col, FormGroup, Input, Label, Modal, ModalBody, ModalFooter, ModalHeader, Pagination, PaginationItem, PaginationLink, Row, Table } from 'reactstrap'
import { deleteApp, getClinics, getStasusAppsInDate, getappsInDate, updateApp } from '../../../apiRequest';

export default function StasusAppsInDate() {

    const [appsInDate, setAppsInDate] = useState(null);
    const [clinics, setClinics] = useState(null);
    const [clinic, setClinic] = useState("");
    const [date, setDate] = useState("");
    const [startTime, setStartTime] = useState("");
    const [endTime, setEndTime] = useState("");
    const [idApp, setIdApp] = useState("");
    const [maxPeople, setMaxPeople] = useState("");
    const [errorEdit, setErrorEdit] = useState("");


    const [modal, setModal] = useState(false);

    const toggle = () => {
        setModal(!modal);
        setErrorEdit("")
    }
    const handleStasusAppsInDate = async ()=>{
        const response = await getStasusAppsInDate({id: clinic, date})
        setAppsInDate(response.data[0])
    }
    const handleSaveApp = async () => {
        const start = new Date(`2000-01-01T${startTime}`);
        const end = new Date(`2000-01-01T${endTime}`);
        if (start.getTime() > end.getTime()) {
            setErrorEdit('Thời gian bắt đầu không thể lớn hơn thời gian kết thúc!');}
        else if (end.getTime() - start.getTime() < 60*30*1000) {
            setErrorEdit('Cuộc hẹn phải ít nhất 30 phút!');
        }
        else{
            if(maxPeople < 10) setErrorEdit('Số người tối đa không được nhỏ hơn 10!');
            else {
                await updateApp({id: idApp,startTime,endTime, maxPeople})
                setAppsInDate(appsInDate.map(app=>{
                    if (app.appointment_id === idApp){
                        return {...app, time_start: startTime, time_end: endTime, max_people: maxPeople}
                    }
                    return app;
                }))
                toggle()
            }
        }
    }
    const handleDeleteApp = async (id)=>{
        await deleteApp({id})
        setAppsInDate(appsInDate.filter(app=> app.appointment_id !== id
        ))
    }
    const handleEditApp = (app)=>{
        setStartTime(app.time_start)
        setEndTime(app.time_end)
        setIdApp(app.appointment_id)
        setMaxPeople(app.max_people)
        toggle()
    }
    useEffect(() => {
        (async () => {
           const response = await getClinics();
          setClinics(response.data)
        })();
      }, []);

      return (
    <div style={{padding: "20px"}}>
              <Modal isOpen={modal} toggle={toggle} >
        <ModalHeader toggle={toggle}>Chỉnh sửa cuộc hẹn</ModalHeader>
        <ModalBody>
        <Form>
  <Row className="row-cols-lg-auto g-3 align-items-center">
    <Col>
      <Label
        for="startTime"
      >
        Thời gian bắt đầu
      </Label>
      <Input
        name="startTime"
        type="time"
        value={startTime}
        onChange={(e)=> setStartTime(e.target.value+":00")}
      />
    </Col>
    <Col>
      <Label
        for="endTime"
      >
       Thời gian kết thúc
      </Label>
      <Input
        name="endTime"
        type="time"
        value={endTime}
        onChange={(e)=> setEndTime(e.target.value+":00")}
      />
    </Col>
    <Col>
      <Label
        for="endTime"
      >
       Số người tối đa
      </Label>
      <Input
        name="endTime"
        type="number"
        value={maxPeople}
        onChange={(e)=> setMaxPeople(e.target.value)}
      />
    </Col>
  </Row>
</Form>
<p style={{color: "red", margin: "0"}}>{errorEdit}</p>
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onClick={handleSaveApp}>
            Lưu thây đổi
          </Button>{' '}
          <Button color="secondary" onClick={toggle}>
            Hủy
          </Button>
        </ModalFooter>
      </Modal>

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

          for="exampleDate">
      Chọn ngày
    </Label>
    <Input
      name="date"
      placeholder="Chọn ngày"
      type="date"
      value={date}
      onChange={(e) => setDate(e.target.value)}
    />
    </Col>
      <Button onClick={handleStasusAppsInDate}>
        Lấy danh sách cuộc hẹn
      </Button>
  </Row>
</Form>
{!appsInDate?"":<Table
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
        Cuộc hẹn lúc
      </th>
      <th>
        Kết thúc lúc
      </th>
      <th>
        Số người đăng ký
      </th>
      <th>
        Số người tối đa
      </th>
      <th>
        Số người tới khám
      </th>
      <th>
        Số người bỏ khám
      </th>
      <th>
        Action
      </th>
    </tr>
  </thead>
  <tbody>
    {
        appsInDate?.map((app, index)=>(
            <tr key={app.appointment_id}>
            <th scope="row">
              {index}
            </th>
            <td>
              {app.time_start}
            </td>
            <td>
              {app.time_end}
            </td>
            <td>
              {app.people_registed}
            </td>
            <td>
              {app.max_people}
            </td>
            <td>
              {app.count_confirm}
            </td>
            <td>
              {app.count_unconfirm}
            </td>
            <td>
              <Button onClick={()=>handleEditApp(app)}  color='primary' style={{marginRight: "5px"}}>sửa</Button>
              <Button color='danger' onClick={()=>handleDeleteApp(app.appointment_id)}>Xóa</Button>

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
