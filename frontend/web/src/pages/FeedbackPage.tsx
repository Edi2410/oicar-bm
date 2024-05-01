import { FeedBackForm } from "@components";
import { Spin } from "antd";
import { Suspense } from "react";

export const FeedbackPage = () => {
  return (
    <div className="pageSize">
      <Suspense fallback={<Spin />}>
        <FeedBackForm />
      </Suspense>
    </div>
  );
};
