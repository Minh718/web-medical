import {
  createBrowserRouter,
  createRoutesFromElements,
  Navigate,
  Outlet,
  Route,
  RouterProvider,
} from "react-router-dom";
import { useEffect } from "react";
import { useGlobalContext } from "./context";
import AdminPage from "./Pages/Admin";
import Home from "./Pages/Home";
import Login from "./Pages/Login";
import Header from "./Components/Header/Header";
import 'bootstrap/dist/css/bootstrap.min.css';
import Register from "./Pages/Register";
import UpdateInfo from "./Pages/UpdateInfo";
import ChanngePassword from "./Pages/ChangePassword";
import PeopleInMonth from "./Pages/Admin/components/PeopleInMonth";
import StasusAppsInDate from "./Pages/Admin/components/StasusAppsInDate";


const PageHome = () => {
  return (
    <>
      <Header />
      <Outlet />
      {/* <Footer /> */}
    </>
  );
};




function App() {
  const { user, setUser } = useGlobalContext();
  useEffect(() => {
    const getUser = async () => {
      setUser(user);
    };
    getUser();
  }, []);
  const router = createBrowserRouter(
    createRoutesFromElements(
      <Route path="">
        <Route path="/" element={<PageHome/>}>
          <Route path="/" element={<Home />} />
          {!user && <Route path="*" element={<Login />} />}
          {!user && <Route path="/register" element={<Register />} />}
          {user && (
            <Route path="">
              <Route path="/profile" element={<UpdateInfo />} />
              <Route path="/changePassword" element={<ChanngePassword />} />
            </Route>
          )}
        </Route>
        {user?.type === "staff" && (
          <Route path="/adminPage" element={<AdminPage />}>
            <Route path="PeopleInMonth" element={<PeopleInMonth />} />
            <Route path="StasusAppsInDate" element={<StasusAppsInDate />} />
          </Route>
        )}
      </Route>
    )
  );
  return (
    <div
      id="App"
      onClick={() => {
      }}
    >
      <RouterProvider router={router} />
    </div>
  );
}

export default App;
