import { useQuery } from "react-query";
import { useAxios } from "./useAxios";
import { message } from "antd";

export const useGetUserData = () => {
  const axios = useAxios();

  const fetchUserData = async () => {
    if (sessionStorage.getItem("accessToken") !== null) {
      try {
        const response = await axios.get("users/user");

        return response?.data;
      } catch (error: any) {
        throw new Error(error?.response?.data?.error);
      }
    }
    return null;
  };

  return useQuery("user_data", fetchUserData, {
    onError: (error: any) => message.error(error?.message),
    staleTime: Infinity,
  });
};
