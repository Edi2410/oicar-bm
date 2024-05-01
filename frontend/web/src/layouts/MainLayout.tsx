import { NavBar, RoutesList } from "@components";
import { Layout } from "antd";

export const MainLayout = () => {
  return (
    <>
      <Layout style={{ background: "transparent" }}>
        <Layout.Header style={{ backgroundColor: "transparent" }}>
          <NavBar />
        </Layout.Header>
        <RoutesList />
      </Layout>
    </>
  );
};
