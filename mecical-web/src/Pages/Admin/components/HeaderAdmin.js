import { FaBars } from "react-icons/fa";
import { Link } from "react-router-dom";
import { Button } from "reactstrap";
function HeaderAdmin({ openBar, setOpenBar }) {
  return (
    <div id="header">
      <div className="header-left header-admin">
        <div
          className={
            openBar ? `container-btn-bar active-bar ` : `container-btn-bar`
          }
          onClick={() => setOpenBar(!openBar)}
        >
          <FaBars />
        </div>

        <Link to={"/adminPage"} className="logoManager">
          {/* <img className="logo-web" src={"/BK-cinema_1.png"} /> */}
          MANAGER CLINIC
        </Link>

        <div className="right-part">
          <Link to="/">
            <Button color="info" outline>
              Trang chủ
            </Button>
          </Link>
        </div>
      </div>
      {/* </div> */}
    </div>
  );
}

export default HeaderAdmin;