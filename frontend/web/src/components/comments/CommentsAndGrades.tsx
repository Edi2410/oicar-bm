import { Card, Flex, Typography, Divider, Statistic } from "antd";
import { useGetCommentsAndGrades } from "../../hooks/feedback/useGetCommentsAndGrades";
import { IoSad } from "react-icons/io5";
import { GradesType } from "../../types/feedback-type";

const CommentsAndGrades = () => {
  const { data: commentsAndGrades } = useGetCommentsAndGrades();

  if (!commentsAndGrades || commentsAndGrades.length === 0) {
    return (
      <Flex vertical align="center">
        <Typography.Title style={{ color: "white" }}>
          Još nema predanih komentara
        </Typography.Title>

        <IoSad style={{ color: "white" }} size={64} />
      </Flex>
    );
  }

  return (
    <Flex wrap="wrap" gap="small" justify="center">
      {commentsAndGrades?.grades?.map((grade: GradesType, index: number) => (
        <Card key={index} style={{ maxWidth: "400px" }}>
          <Statistic
            title={grade.question}
            value={Number(grade.grade)}
            precision={2}
          />
        </Card>
      ))}
      <Divider />
      {commentsAndGrades?.comment?.map((comment: string, index: number) => (
        <Card
          size="small"
          key={index}
          style={{ maxWidth: "400px", padding: "0" }}
        >
          <Typography.Text>{comment}</Typography.Text>
        </Card>
      ))}
    </Flex>
  );
};
export default CommentsAndGrades;
