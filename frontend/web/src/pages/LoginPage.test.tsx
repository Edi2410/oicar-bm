import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import { LoginPage } from './LoginPage';
import { useAuthUser } from '../hooks/useAuthUser';

jest.mock('../hooks/useAuthUser');

describe('LoginPage Component', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('renders the login form correctly', () => {
    render(<LoginPage />);

    expect(screen.getByLabelText('Korisničko ime:')).toBeInTheDocument();
    expect(screen.getByLabelText('Lozinka:')).toBeInTheDocument();
    expect(screen.getByRole('button', { name: 'Prijavi se' })).toBeInTheDocument();
  });

  it('handles form submission correctly', async () => {
    const mockMutate = jest.fn((userData, options) => {
      options.onSuccess({ data: { access: 'accessToken', refresh: 'refreshToken' } });
    });
    (useAuthUser as jest.Mock).mockReturnValue({ mutate: mockMutate });

    render(<LoginPage />);

    fireEvent.change(screen.getByLabelText('Korisničko ime:'), {
      target: { value: 'testuser' },
    });

    fireEvent.change(screen.getByLabelText('Lozinka:'), {
      target: { value: 'password123' },
    });

    fireEvent.click(screen.getByRole('button', { name: 'Prijavi se' }));

    await waitFor(() => {
      expect(mockMutate).toHaveBeenCalledTimes(1);
      expect(mockMutate).toHaveBeenCalledWith(
        { username: 'testuser', password: 'password123' },
        expect.any(Object)
      );
      expect(sessionStorage.getItem('accessToken')).toBe('accessToken');
      expect(sessionStorage.getItem('refreshToken')).toBe('refreshToken');
    });
  });

  it('validates form inputs', async () => {
    render(<LoginPage />);

    fireEvent.click(screen.getByRole('button', { name: 'Prijavi se' }));

    await waitFor(() => {
      expect(screen.getByText('Molim unesite korisničko ime!')).toBeInTheDocument();
      expect(screen.getByText('Molim unesite lozinku!')).toBeInTheDocument();
    });
  });
});
