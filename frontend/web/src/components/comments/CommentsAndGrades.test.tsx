import { render, screen } from "@testing-library/react";
import { useGetCommentsAndGrades } from "../../hooks/feedback/useGetCommentsAndGrades";
import CommentsAndGrades from "./CommentsAndGrades";

jest.mock("../../hooks/feedback/useGetCommentsAndGrades");

describe("CommentsAndGrades Component", () => {
  it("renders no comments message when data is empty", () => {
    (useGetCommentsAndGrades as jest.Mock).mockReturnValue({
      data: null,
    });

    render(<CommentsAndGrades />);

    expect(screen.getByText("Još nema predanih komentara")).toBeInTheDocument();
  });

  it("renders comments and grades correctly", () => {
    (useGetCommentsAndGrades as jest.Mock).mockReturnValue({
      data: {
        grades: [
          { question: "Question 1", grade: "4.5" },
          { question: "Question 2", grade: "3.8" },
        ],
        comment: ["Great job!", "Needs improvement."],
      },
    });

    render(<CommentsAndGrades />);

    expect(screen.getByText("Question 1")).toBeInTheDocument();
    expect(screen.getByText("4",)).toBeInTheDocument();
    expect(screen.getByText("Question 2")).toBeInTheDocument();
    expect(screen.getByText("3")).toBeInTheDocument();
    expect(screen.getByText("Great job!")).toBeInTheDocument();
    expect(screen.getByText("Needs improvement.")).toBeInTheDocument();
  });
});
