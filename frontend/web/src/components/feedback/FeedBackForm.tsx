import {
  Button,
  Card,
  Flex,
  Form,
  Input,
  Radio,
  Select,
  Typography,
} from "antd";
import {
  FeedbackType,
  QuestionFormType,
  QuestionType,
} from "../../types/feedback-type";

import { useGetUserForFeedback } from "../../hooks/feedback/useGetUserData";
import { UserData } from "../../types/user-types";
import { useUserContext } from "../../hooks/useUserContext";
import { useAddFeedback } from "../../hooks/feedback/useAddFeedback";
import { useGetQuestions } from "../../hooks/feedback/useGetQuestions";

const FeedbackPage = () => {
  const { user } = useUserContext();
  const { data: userForFeedback } = useGetUserForFeedback();
  const [form] = Form.useForm();
  const { mutate: addFeedback, isLoading } = useAddFeedback();
  const { data: questions } = useGetQuestions();

  const formSubmit = (formValues: any) => {
    var temp: QuestionFormType[] = [];
    questions?.map((question: QuestionType) => {
      temp.push({
        question: Number(question.id),
        grade: formValues?.answers[question.id],
      });
    });
    const values: FeedbackType = {
      feedback_to: formValues?.feedback_for,
      feedback_from: user?.user?.id,
      is_from_company: user?.is_company,
      comment: formValues?.comment,
      questions: temp,
    };

    addFeedback(values, { onSuccess: () => form.resetFields() });
  };
  return (
    <Card
      style={{
        maxWidth: "600px",
        margin: "auto",
      }}
      title={<Typography.Title level={3}>Predaj feedback</Typography.Title>}
    >
      <Form layout="vertical" onFinish={formSubmit} form={form}>
        <Form.Item
          name={["feedback_for"]}
          rules={[
            { required: true, message: "Odaberi kome predaješ feedback" },
          ]}
          style={{ marginBottom: "5px" }}
        >
          <Select
            showSearch
            placeholder="Odaberi kome predaješ feedback"
            filterOption={(input, option) => {
              return (option?.label ?? "")
                .toString()
                .toLowerCase()
                .includes(input.toLowerCase());
            }}
            filterSort={(optionA, optionB) => {
              return (optionA?.label ?? "")
                .toString()
                .toLowerCase()
                .localeCompare((optionB?.label ?? "").toString().toLowerCase());
            }}
            options={userForFeedback?.map((user: UserData) => ({
              label: `${user?.user.username} ${user?.user.last_name}`,
              value: user.user.id,
            }))}
          ></Select>
        </Form.Item>
        {questions?.map((question: any) => (
          <Form.Item
            key={question.id}
            style={{ marginBottom: "5px", width: "100%" }}
            label={
              <Typography.Title level={4}>{question.question}</Typography.Title>
            }
            name={["answers", question.id]}
            rules={[{ required: true, message: "Odaberi ocjenu" }]}
          >
            <Radio.Group
              size="large"
              style={{ width: "100%" }}
              buttonStyle="solid"
            >
              <Radio.Button value="1" className="radioButton">
                1
              </Radio.Button>
              <Radio.Button value="2" className="radioButton">
                2
              </Radio.Button>
              <Radio.Button value="3" className="radioButton">
                3
              </Radio.Button>
              <Radio.Button value="4" className="radioButton">
                4
              </Radio.Button>
              <Radio.Button value="5" className="radioButton">
                5
              </Radio.Button>
            </Radio.Group>
          </Form.Item>
        ))}
        <Form.Item
          style={{ fontSize: "32px", marginBottom: "20px" }}
          label={
            <Typography.Title level={4}>Dodatni komentar</Typography.Title>
          }
          name={["comment"]}
          rules={[{ required: true, message: "Unesi komentar", min: 15 }]}
        >
          <Input.TextArea style={{ height: "125px" }} showCount />
        </Form.Item>
        <Flex justify="end">
          <Form.Item style={{ margin: "0" }}>
            <Button
              type="primary"
              htmlType="submit"
              style={{ fontWeight: "bold" }}
              loading={isLoading}
            >
              Predaj
            </Button>
          </Form.Item>
        </Flex>
      </Form>
    </Card>
  );
};
export default FeedbackPage;
