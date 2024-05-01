import { InviteForm } from "@components";
import { Spin } from "antd";
import { Suspense } from "react";
import { useUserContext } from "../hooks/useUserContext";

export const InvitePage = () => {
  const { user } = useUserContext();
  if (!user?.is_admin) {
    return <div>Not authorized</div>;
  }

  return (
    <div className="pageSize">
      <Suspense fallback={<Spin />}>
        <InviteForm />
      </Suspense>
    </div>
  );
};
