import { fireEvent, render, screen, waitFor } from "@testing-library/react";
import { useAddFeedback } from "../../hooks/feedback/useAddFeedback";
import { useGetQuestions } from "../../hooks/feedback/useGetQuestions";
import { useGetUserForFeedback } from "../../hooks/feedback/useGetUserData";
import { useUserContext } from "../../hooks/useUserContext";
import FeedBackForm from "./FeedBackForm";

jest.mock("../../hooks/useUserContext");
jest.mock("../../hooks/feedback/useGetUserData");
jest.mock("../../hooks/feedback/useAddFeedback");
jest.mock("../../hooks/feedback/useGetQuestions");

describe("FeedBackForm Component", () => {
  beforeEach(() => {
    jest.clearAllMocks();

    (useUserContext as jest.Mock).mockReturnValue({
      user: { user: { id: 1 }, is_company: false },
    });

    (useGetUserForFeedback as jest.Mock).mockReturnValue({
      data: [
        { user: { id: 1, username: "John", last_name: "Doe" } },
        { user: { id: 2, username: "Jane", last_name: "Smith" } },
      ],
    });

    (useGetQuestions as jest.Mock).mockReturnValue({
      data: [
        { id: 1, question: "Pitanje 1" },
        { id: 2, question: "Pitanje 2" },
      ],
    });

    (useAddFeedback as jest.Mock).mockReturnValue({
      mutate: jest.fn(),
      isLoading: false,
    });
  });

  it("renders the form correctly", () => {
    render(<FeedBackForm />);

    expect(screen.getByText("Predaj feedback")).toBeInTheDocument();
    expect(
      screen.getByText("Odaberi kome predaješ feedback")
    ).toBeInTheDocument();
    expect(screen.getByText("Pitanje 1")).toBeInTheDocument();
    expect(screen.getByText("Pitanje 2")).toBeInTheDocument();
    expect(screen.getByText("Dodatni komentar")).toBeInTheDocument();
    expect(screen.getByRole("button", { name: "Predaj" })).toBeInTheDocument();
  });

  it("handles form submission correctly", async () => {
    const mockMutate = jest.fn();
    (useAddFeedback as jest.Mock).mockReturnValue({
      mutate: mockMutate,
      isLoading: false,
    });

    render(<FeedBackForm />);

    fireEvent.mouseDown(screen.getByRole("combobox"));
    fireEvent.click(screen.getByText("John Doe"));
    fireEvent.click(screen.getAllByText("1")[0]);
    fireEvent.click(screen.getAllByText("2")[1]);
    fireEvent.input(screen.getByRole("textbox"), { target: { value: "Bravoooooooooooo!" } });
    fireEvent.click(screen.getByText("Predaj"));

    await waitFor(() => {
      expect(mockMutate).toHaveBeenCalledTimes(1);
      expect(mockMutate).toHaveBeenCalledWith(
        expect.objectContaining({
          feedback_to: 1,
          feedback_from: 1,
          is_from_company: false,
          comment: "Bravoooooooooooo!",
          questions: [
            { question: 1, grade: "1" },
            { question: 2, grade: "2" },
          ],
        }),
        expect.any(Object)
      );
    });
  });

  it("validates form inputs", async () => {
    render(<FeedBackForm />);

    fireEvent.click(screen.getByText("Predaj"));

    await waitFor(() => {
      expect(screen.getAllByText("Odaberi kome predaješ feedback")).toHaveLength(2);
      expect(screen.getAllByText("Odaberi ocjenu")).toHaveLength(2);
      expect(screen.getByText("Unesi komentar")).toBeInTheDocument();
    });
  });
});
