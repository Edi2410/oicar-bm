import { UserLoginData } from "@types";
import { Button, Card, Flex, Form, Input, Image } from "antd";
import { useAuthUser } from "../hooks/useAuthUser";
import logo from "./../assets/images/BM_outline_Crni.svg";
export const LoginPage = () => {
  const authUser = useAuthUser();

  function authenticateUser(userData: UserLoginData): void {
    authUser.mutate(userData, {
      onSuccess: (data) => {
        sessionStorage.setItem("accessToken", data?.data?.access);
        sessionStorage.setItem("refreshToken", data?.data?.refresh);
        window.location.reload();
      },
    });
  }

  return (
    <Flex style={{ height: "100vh" }} justify="center" align="center" vertical>
      <Image
        src={logo}
        preview={false}
        width={"40%"}
        style={{ marginBottom: "10%" }}
      />

      <Card
        style={{
          padding: 10,
          borderRadius: 20,
        }}
      >
        <Form
          name="loginForm"
          style={{ maxWidth: 550, fontWeight: "bold" }}
          initialValues={{ remember: true }}
          layout="vertical"
          onFinish={authenticateUser}
        >
          <Form.Item<UserLoginData>
            label="Korisničko ime:"
            name="username"
            rules={[
              { required: true, message: "Molim unesite korisničko ime!" },
            ]}
          >
            <Input />
          </Form.Item>

          <Form.Item<UserLoginData>
            label="Lozinka:"
            name="password"
            rules={[{ required: true, message: "Molim unesite lozinku!" }]}
          >
            <Input.Password />
          </Form.Item>
          <Flex justify="end">
            <Form.Item style={{ margin: 0 }}>
              <Button
                type="primary"
                htmlType="submit"
                style={{ fontWeight: "bold" }}
              >
                Prijavi se
              </Button>
            </Form.Item>
          </Flex>
        </Form>
      </Card>
    </Flex>
  );
};
