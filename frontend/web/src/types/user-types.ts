export type UserData = {
  user: User;
  is_admin: boolean;
  is_company: boolean;
  is_student: boolean;
  group: UserGroupData;
  folder_id: FolderData[];
};

export type User = {
  id: number;
  username: string;
  email: string;
  first_name: string;
  last_name: string;
};

export type UserLoginData = {
  username: string;
  password: string;
};

export type UserGroupData = {
  group_name: string;
};

export type FolderData = {
  drive_link: string;
  folder_name: string;
  group: number;
  id: number;
};
