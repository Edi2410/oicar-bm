import { Route, Routes } from "react-router-dom";
import { routes } from "../configurations/routes";

const RoutesList = () => {
  const routeComponents: any = routes.map((element) => {
    return (
      <Route path={element.path} element={element.element} key={element.key} />
    );
  });
  
  return (
    <Routes>
      <Route>{routeComponents}</Route>
    </Routes>
  );
};
export default RoutesList;
