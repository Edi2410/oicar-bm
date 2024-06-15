import { fireEvent, render, screen, waitFor } from "@testing-library/react";
import { InviteFormCheckBox } from "../../configurations/InviteForm";
import { useInviteUser } from "../../hooks/invite/useInviteUser";
import InviteForm from "./InviteForm";

jest.mock("../../hooks/invite/useInviteUser");

describe("InviteForm Component", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("renders the form correctly", () => {
    render(<InviteForm />);

    expect(screen.getByLabelText("Ime")).toBeInTheDocument();
    expect(screen.getByLabelText("Prezime")).toBeInTheDocument();
    expect(screen.getByLabelText("email")).toBeInTheDocument();
    expect(
      screen.getByLabelText("Skupina poduzeća (opcionalno)")
    ).toBeInTheDocument();
    InviteFormCheckBox.forEach((option) => {
      expect(screen.getByLabelText(option.label)).toBeInTheDocument();
    });
    expect(screen.getByRole("button", { name: "Dodaj" })).toBeInTheDocument();
  });

  it("handles form submission correctly", async () => {
    const mockMutate = jest.fn();
    (useInviteUser as jest.Mock).mockReturnValue({
      mutate: mockMutate,
      isLoading: false,
    });

    render(<InviteForm />);

    fireEvent.change(screen.getByLabelText("Ime"), {
      target: { value: "John" },
    });
    fireEvent.change(screen.getByLabelText("Prezime"), {
      target: { value: "Doe" },
    });
    fireEvent.change(screen.getByLabelText("email"), {
      target: { value: "john.doe@example.com" },
    });
    fireEvent.change(screen.getByLabelText("Skupina poduzeća (opcionalno)"), {
      target: { value: "Group 1" },
    });
    fireEvent.click(screen.getByLabelText("Poduzeće"));
    fireEvent.click(screen.getByLabelText("Student"));
    fireEvent.click(screen.getByLabelText("Admin"));
    fireEvent.click(screen.getByText("Dodaj"));

    await waitFor(() => {
      expect(mockMutate).toHaveBeenCalledTimes(1);
      expect(mockMutate).toHaveBeenCalledWith(
        expect.objectContaining({
          first_name: "John",
          last_name: "Doe",
          email: "john.doe@example.com",
          group: "Group 1",
          is_admin: true,
          is_company: true,
          is_student: true,
        }),
        expect.any(Object)
      );
    });
  });

  it("validates form inputs", async () => {
    render(<InviteForm />);

    fireEvent.click(screen.getByRole("button", { name: "Dodaj" }));

    await waitFor(() => {
      expect(screen.getByText("Unesi ime osobe")).toBeInTheDocument();
      expect(screen.getByText("Unesi email osobe")).toBeInTheDocument();
    });
  });
});
