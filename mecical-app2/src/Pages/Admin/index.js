import React, { useState } from "react";
import { Outlet } from "react-router-dom";
import Common from "./commom/index";
import HeaderAdmin from "./components/HeaderAdmin";
export default function AdminPage() {
  const [openBar, setOpenBar] = useState(true);
  return (
    <>
      <HeaderAdmin setOpenBar={setOpenBar} openBar={openBar} />
      <Common setOpenBar={setOpenBar} openBar={openBar}>
        <Outlet />
      </Common>
    </>
  );
}