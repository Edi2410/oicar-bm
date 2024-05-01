
import { CommentsAndGradesPage } from "../pages/CommentsAndGradesPage";
import { CvPage } from "../pages/CvPage";
import { FeedbackPage } from "../pages/FeedbackPage";
import { InvitePage } from "../pages/InvitePage";
interface Routes {
  path: string;
  element: JSX.Element;
  key: string;
}
export const routes: Routes[] = [
  {
    path: "/",
    element: <FeedbackPage />,
    key: "/",
  },
  {
    path: "/invite",
    element: <InvitePage />,
    key: "/invite",
  },
  {
    path: "/cv",
    element: <CvPage />,
    key: "/cv",
  },
  {
    path: "/grades",
    element: <CommentsAndGradesPage />,
    key: "/grades",
  },
];
