export type FeedbackType = {
  id?: number;
  feedback_from?: number;
  feedback_to: number;
  comment: string;
  is_from_company?: boolean;
  questions: QuestionFormType[];
};

export type QuestionType = {
  id: number;
  question: string;
  is_for_company: boolean;
};

export type QuestionFormType = {
  question: number;
  grade: number;
};

export type CommentsAndGradesType = {
  comment: string[];
  grades: GradesType[];
};

export type GradesType = {
  grade: number;
  question: string;
};
