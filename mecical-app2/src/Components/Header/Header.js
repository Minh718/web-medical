import { useState } from "react";
import { HiOutlineUserCircle } from "react-icons/hi";
import { Link, NavLink, useNavigate } from "react-router-dom";
import { Badge, Button, Nav, NavItem } from "reactstrap";
import { useGlobalContext } from "../../context";
import { Modal, ModalHeader, ModalBody, ModalFooter } from 'reactstrap';
import "./style.css";
import { deleteUser } from "../../apiRequest";
function Header() {
  const navigate = useNavigate();

  const { user, setUser } = useGlobalContext();
    const [openSetting, setOpenSetting] = useState(false)
    const [modal, setModal] = useState(false);
    const [error, setError] = useState("")

    const handleDeleteUser = async ()=>{
      const response = await deleteUser({id: user.id})
      if(response.status === 500){
        setError(response.data.error.sqlMessage)
      }
      else{
      setUser(null);
      setOpenSetting(false)
      toggle()
        navigate("/");
      }
    }
    const toggle = (e) => {
      setError("")
      setModal(!modal);
    }
  return (
    <div id="header">
      <div className="header-left">
        <Link to={"/"}>
        <h1>
            <Badge>
            Medical
            </Badge>
            </h1>
        </Link>
        {/* <div className="right-part"> */}
<div className="nav-middle1">

        <Nav
>
  <NavItem>
    <NavLink
      active
      href="#"
      >
      Home page
    </NavLink>
  </NavItem>
  <NavItem>
    <NavLink href="#">
      About
    </NavLink>
  </NavItem>
  <NavItem>
    <NavLink
      disabled
      href="#"
      >
      Service
    </NavLink>
  </NavItem>
  <NavItem>
    <NavLink
      disabled
      href="#"
      >
      Contact
    </NavLink>
  </NavItem>
</Nav>
            </div>
        <div className="right-part">
          {user ? (
              <div
              className="user-btn"
            >
              <Button color="primary">Make Apppointment</Button>
              <button className="btn-setting" onClick={()=> setOpenSetting(!openSetting)}>
                <HiOutlineUserCircle size={40} />
              </button>
              <span
                className="login-nav"
              >
                {user?.lname}
              </span>
              {openSetting && (
                <div className="setting-user" onClick={()=> setOpenSetting(!openSetting)}>
                  <Link to="/profile">Hồ sơ của tôi</Link>
                  <Link to="/changePassword">Thay đổi mật khẩu</Link>
                  <Link onClick={(e)=> {
                    e.stopPropagation()
                    toggle()
                  }}>Vô hiệu hóa tài khoản
                  <Modal isOpen={modal} toggle={toggle}>
                          <p className="errorDelete">{error}</p>
        <ModalHeader toggle={toggle}>Xóa tài khoản</ModalHeader>
        <ModalBody>
                  Xác nhận xóa tài khoản
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onClick={
            handleDeleteUser
}>
            Đồng ý
          </Button>{' '}
          <Button color="secondary" onClick={toggle}>
           Hủy
          </Button>
        </ModalFooter>
      </Modal>
                  </Link>

                  {user?.type === 'staff' && <Link to="/adminPage">Trang quản lý</Link>}
                  <Link
                    to="/adminPage"
                    onClick={async (e) => {
                      e.preventDefault();
                      setUser(null);
                    }}
                  >
                    Đăng xuất
                  </Link>
                </div>
              )}
            </div>
          ) : (
            <Link to="/login" className="login-nav">
                <Button color="primary">Đăng nhập</Button>
            </Link>
          )}
        </div>
      </div>
      {/* </div> */}
    </div>
  );
}

export default Header;