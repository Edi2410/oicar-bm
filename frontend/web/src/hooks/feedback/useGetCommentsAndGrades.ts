import { useQuery } from "react-query";
import { useAxios } from "../useAxios";
import { message } from "antd";

export const useGetCommentsAndGrades = () => {
  const axios = useAxios();

  const fetchCommentsAndGrades = async () => {
    if (sessionStorage.getItem("accessToken") !== null) {
      try {
        const response = await axios.get("feedback/");
        return response?.data;
      } catch (error: any) {
        throw new Error(error?.response?.data?.error);
      }
    }
    return null;
  };

  return useQuery("comments_and_grades", fetchCommentsAndGrades, {
    onError: (error: any) => message.error(error?.message),
    staleTime: Infinity,
  });
};
