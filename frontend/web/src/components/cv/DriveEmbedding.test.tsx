import { render, screen } from '@testing-library/react';
import DriveEmbedding from './DriveEmbedding';
import { useUserContext } from '../../hooks/useUserContext';

jest.mock('../../hooks/useUserContext');

describe('DriveEmbedding Component', () => {
  it('renders "Not authorized" message for student users', () => {
    (useUserContext as jest.Mock).mockReturnValue({
      user: { is_student: true },
    });

    render(<DriveEmbedding />);

    expect(screen.getByText('Not authorized')).toBeInTheDocument();
  });

  it('renders support message when folder_id is missing or empty', () => {
    (useUserContext as jest.Mock).mockReturnValue({
      user: { is_student: false, folder_id: [] },
    });

    render(<DriveEmbedding />);

    expect(screen.getByText('Obratite se na it.podrska@estudent.hr')).toBeInTheDocument();
  });

  it('renders folder details and iframes when folder_id is present', () => {
    (useUserContext as jest.Mock).mockReturnValue({
      user: {
        is_student: false,
        folder_id: [
          { id: '1', folder_name: 'Folder 1', drive_link: 'link1' },
          { id: '2', folder_name: 'Folder 2', drive_link: 'link2' },
        ],
      },
    });

    render(<DriveEmbedding />);

    expect(screen.getByText('Folder 1')).toBeInTheDocument();
    expect(screen.getByText('Folder 2')).toBeInTheDocument();
    expect(screen.getByTitle('iframe-1')).toHaveAttribute('src', 'https://drive.google.com/embeddedfolderview?id=link1#list');
    expect(screen.getByTitle('iframe-2')).toHaveAttribute('src', 'https://drive.google.com/embeddedfolderview?id=link2#list');
  });
});
