import { lazy } from "react";
import RoutesList from "./RoutesList";

const NavBar = lazy(() => import("./NavBar"));
const FeedBackForm = lazy(() => import("./feedback/FeedBackForm"));
const InviteForm = lazy(() => import("./invite/InviteForm"));
const DriveEmbedding = lazy(() => import("./cv/DriveEmbedding"));
const CommentsAndGrades = lazy(() => import("./comments/CommentsAndGrades"));

export {
  NavBar,
  RoutesList,
  FeedBackForm,
  InviteForm,
  DriveEmbedding,
  CommentsAndGrades,
};
