import { useMutation, useQueryClient } from "react-query";
import { UserLoginData } from "@types";
import { useAxios } from "./useAxios";
import { message } from "antd";

export const useAuthUser = () => {
  const axios = useAxios();
  const queryClient = useQueryClient();

  const authUser = async (userLoginData: UserLoginData) => {
    try {
      const response = await axios.post("auth/", userLoginData);
      return response;
    } catch (error) {
      throw new Error("Pogrešno korisničko ime ili lozinka.");
    }
  };

  return useMutation(authUser, {
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["partners_list_data"] });
    },
    onError: (error: Error) => {
      message.error(error.message);
    },
  });
};
