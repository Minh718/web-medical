import "./index.css";
import { useState, useEffect } from "react";
import { FaAngleDown, FaAngleUp } from "react-icons/fa";
import { useNavigate, Link } from "react-router-dom";
import { Button } from "reactstrap";
import { useGlobalContext } from "../../../context";
function Common({ children, openBar }) {
  const navigate = useNavigate();
  const { setUser } = useGlobalContext();
  const [index, setIndex] = useState(0);
  return (
    <div className="common-page">
      <div className={openBar ? "left-page" : "left-page move-left-page"}>
        <div>
          <div>
            <div
              className="accordion"
              onClick={() => (index !== 1 ? setIndex(1) : setIndex(0))}
            >
              Quản lý Clinic
              {index === 1 ? <FaAngleUp /> : <FaAngleDown />}
            </div>
            <div
              className={index === 1 ? "click-down active" : "click-down"}
              onClick={() => navigate("/adminPage/PeopleInMonth")}
            >
              Danh sách số lần khám
            </div>
            <div
              className={index === 1 ? "click-down active" : "click-down"}
              onClick={() => navigate("/adminPage/StasusAppsInDate")}
            >
              Các cuộc hẹn trong ngày
            </div>
          </div>
        </div>
        <div className="ctn-btn-out">
          <Button
            color="warning"
            className="btn-out"
            outline
            onClick={() => {
              setUser(null);
              navigate("/login");
            }}
          >
            Đăng xuất
          </Button>
        </div>
      </div>
      <div className={openBar ? "right-page" : "right-page move-right-page"}>
        {" "}
        {children}{" "}
      </div>
    </div>
  );
}

export default Common;