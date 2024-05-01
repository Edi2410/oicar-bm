import { useQuery } from "react-query";
import { useAxios } from "./../useAxios";
import { message } from "antd";

export const useGetQuestions = () => {
  const axios = useAxios();

  const fetchQuestions = async () => {
    if (sessionStorage.getItem("accessToken") !== null) {
      try {
        const response = await axios.get("feedback/question/");
        return response?.data;
      } catch (error: any) {
        throw new Error(error?.response?.data?.error);
      }
    }
    return null;
  };

  return useQuery("questions_data", fetchQuestions, {
    onError: (error: any) => message.error(error?.message),
    staleTime: Infinity,
  });
};
