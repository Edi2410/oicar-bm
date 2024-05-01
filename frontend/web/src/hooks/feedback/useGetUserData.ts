import { useQuery } from "react-query";
import { useAxios } from "./../useAxios";
import { message } from "antd";

export const useGetUserForFeedback = () => {
  const axios = useAxios();

  const fetchUserForFeedback = async () => {
    if (sessionStorage.getItem("accessToken") !== null) {
      try {
        const response = await axios.get("users/user/for-feedback");
        return response?.data;
      } catch (error: any) {
        throw new Error(error?.response?.data?.error);
      }
    }
    return null;
  };

  return useQuery("user_for_feedback_data", fetchUserForFeedback, {
    onError: (error: any) => message.error(error?.message),
    staleTime: Infinity,
  });
};
