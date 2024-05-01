import { useMutation } from "react-query";
import { UserData } from "@types";
import { message } from "antd";
import { useAxios } from "../useAxios";

export const useInviteUser = () => {
  const axios = useAxios();

  const inviteUser = async (userData: UserData) => {
    try {
      const response = await axios.post("users/invite/", userData);
      return response;
    } catch (error: any) {
      throw new Error(error.response.data.message);
    }
  };

  return useMutation(inviteUser, {
    onSuccess: () => {
      message.success("Korisnik uspješno pozvan.");
    },
    onError: (error: Error) => {
      message.error(error.message);
    },
  });
};
