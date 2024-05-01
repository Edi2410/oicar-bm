import "./App.css";

import { LoginPage } from "./pages/LoginPage";
import backgroundImage from "./assets/images/EFZGSilueta-01.svg";
import { useUserContext } from "./hooks/useUserContext";
import { MainLayout } from "./layouts/MainLayout";
import { useEffect } from "react";
import { useGetUserData } from "./hooks/useGetUserData";
import { UserData } from "./types/user-types";

function App() {
  const { setUser } = useUserContext();
  const { data: userData } = useGetUserData();

  useEffect(() => {
    const value: UserData = userData;
    setUser(value);
  }, [userData, setUser]);

  return (
    <div
      style={{
        backgroundImage: `url(${backgroundImage})`,
        objectFit: "cover",
        backgroundPosition: "center",
        backgroundRepeat: "no-repeat",
        backgroundAttachment: "fixed",
        backgroundColor: "#861949",
        minHeight: "100vh",
      }}
    >
      {!userData ? <LoginPage /> : <MainLayout />}
    </div>
  );
}

export default App;
