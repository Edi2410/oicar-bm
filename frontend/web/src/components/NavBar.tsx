import { Button, Dropdown, Flex, Image, Space, message } from "antd";

import { useNavigate } from "react-router-dom";
import logo from "./../assets/images/BM_outline_Crni.svg";
import { useUserContext } from "../hooks/useUserContext";
import type { MenuProps } from "antd";
import { useMediaQuery } from "react-responsive";

const navBarButtonStyle = {
  border: 0,
  fontSize: "16px",
  boxShadow: "rgba(365, 365, 365, 0.5) 5px 5px 5px",
  transition: "background-color 0.3s ease, border 0.3s ease",
};

const adminButtonStyle = {
  border: 0,
  fontSize: "16px",
  backgroundColor: "#000000",
  color: "#ffffff",
  boxShadow: "rgba(365, 365, 365, 0.5) 5px 5px 5px",
  transition: "background-color 0.3s ease, border 0.3s ease",
};

const NavBar = () => {
  const { user } = useUserContext();
  const navigate = useNavigate();

  const isMobile = useMediaQuery({
    query: "(min-width: 650px)",
  });
  var items: MenuProps["items"];

  if (user?.is_admin) {
    items = [
      {
        label: "Feedback",
        key: "1",
      },
      {
        label: "Profili",
        key: "2",
      },
      {
        label: "Ocjene",
        key: "3",
      },
      {
        label: "Dodaj korisnika",
        key: "4",
      },
    ];
  } else if (user?.is_company) {
    items = [
      {
        label: "Feedback",
        key: "1",
      },
      {
        label: "Profili",
        key: "2",
      },
      {
        label: "Ocjene",
        key: "3",
      },
    ];
  } else {
    items = [
      {
        label: "Feedback",
        key: "1",
      },
      {
        label: "Ocjene",
        key: "3",
      },
    ];
  }

  const handleMenuClick: MenuProps["onClick"] = (e) => {
    switch (e.key) {
      case "1":
        navigate("/");
        break;
      case "2":
        navigate("/cv");
        break;
      case "3":
        navigate("/grades");
        break;
      case "4":
        navigate("/invite");
        break;
      default:
        message.error("Javi se na it.podrska@estudent.hr");
    }
  };

  const menuProps = {
    items,
    onClick: handleMenuClick,
  };

  return (
    <Flex
      justify="space-between"
      align="center"
      style={{ width: "100%", height: "100%", marginTop: "5px" }}
    >
      <Image src={logo} preview={false} width={125} />

      <div>
        {isMobile ? (
          <Space>
            <Button onClick={() => navigate("/")} style={navBarButtonStyle}>
              Feedback
            </Button>
            {user?.is_company && (
              <Button onClick={() => navigate("/cv")} style={navBarButtonStyle}>
                Profili
              </Button>
            )}
            <Button
              onClick={() => navigate("/grades")}
              style={navBarButtonStyle}
            >
              Ocjene
            </Button>
            {user?.is_admin && (
              <Button
                onClick={() => navigate("/invite")}
                style={adminButtonStyle}
              >
                Dodaj korisnika
              </Button>
            )}
          </Space>
        ) : (
          <>
            <Dropdown menu={menuProps} placement="bottomRight" arrow>
              <Button>Izbornik</Button>
            </Dropdown>
          </>
        )}
      </div>
    </Flex>
  );
};
export default NavBar;
