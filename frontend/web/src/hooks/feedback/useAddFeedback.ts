import { useMutation } from "react-query";
import { message } from "antd";
import { useAxios } from "../useAxios";
import { FeedbackType } from "../../types/feedback-type";

export const useAddFeedback = () => {
  const axios = useAxios();

  const addFeedback = async (feedback: FeedbackType) => {
    try {
      const response = await axios.post("feedback/", feedback);
      return response.data;
    } catch (error) {
      throw new Error("Greška prilikom predaje feedbacka");
    }
  };

  return useMutation(addFeedback, {
    onSuccess: () => {
      message.success("Feedback je uspješno predan!");
    },
  });
};
