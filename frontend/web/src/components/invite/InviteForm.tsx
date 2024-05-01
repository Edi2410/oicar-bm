import { Button, Card, Checkbox, Flex, Form, Input } from "antd";
import { InviteFormCheckBox } from "../../configurations/InviteForm";
import { UserData } from "../../types/user-types";
import { useInviteUser } from "../../hooks/invite/useInviteUser";
import { useState } from "react";

const InviteForm = () => {
  const [isLoading, setIsLoading] = useState(false);
  const [form] = Form.useForm();
  const inviteUser = useInviteUser();
  const formSubmit = (values: any) => {
    setIsLoading(true);
    const sendValues: UserData = {
      ...values,
      is_admin: values.role.includes("is_admin"),
      is_company: values.role.includes("is_company"),
      is_student: values.role.includes("is_student"),
    };
    inviteUser.mutate(sendValues, {
      onSuccess: () => {
        form.resetFields();
        setIsLoading(false);
      },
      onError: () => {
        setIsLoading(false);
      },
    });
  };

  return (
    <Card
      style={{
        maxWidth: "600px",
        margin: "auto",
      }}
    >
      <Form layout="vertical" onFinish={formSubmit} form={form}>
        <Form.Item
          style={{ fontSize: "32px", marginBottom: "5px" }}
          label="Ime"
          name={["first_name"]}
          rules={[{ required: true, message: "Unesi ime osobe" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          style={{ fontSize: "32px", marginBottom: "5px" }}
          label="Prezime"
          name={["last_name"]}
          rules={[{ message: "Unesi prezime osobe" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          style={{ fontSize: "32px", marginBottom: "5px" }}
          label="email"
          name={["email"]}
          rules={[
            { type: "email", required: true, message: "Unesi email osobe" },
          ]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          style={{ fontSize: "32px", marginBottom: "5px" }}
          label="Skupina poduzeća (opcionalno)"
          name={["group"]}
          rules={[{ message: "Unesi skupinu" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          style={{ fontSize: "32px", marginBottom: "5px" }}
          name={["role"]}
        >
          <Checkbox.Group options={InviteFormCheckBox} />
        </Form.Item>
        <Flex justify="end">
          <Form.Item style={{ margin: "0" }}>
            <Button
              type="primary"
              htmlType="submit"
              style={{ fontWeight: "bold" }}
              loading={isLoading}
            >
              Dodaj
            </Button>
          </Form.Item>
        </Flex>
      </Form>
    </Card>
  );
};
export default InviteForm;
